//
//  Thoth+PHAsset.swift
//  Thoth
//
//  Created by Ajiaco on 2021/12/21.
//

import Photos

extension PHAsset {
    
    @inlinable
    public func getURL(completionHandler : ((_ responseURL: URL?) -> Void)?) {
        if self.mediaType == .image {
            let options: PHContentEditingInputRequestOptions = PHContentEditingInputRequestOptions()
            options.canHandleAdjustmentData = {(adjustmeta: PHAdjustmentData) -> Bool in
                return true
            }
            self.requestContentEditingInput(with: options,
                                            completionHandler: {(contentEditingInput: PHContentEditingInput?, _) -> Void in
                                                completionHandler?(contentEditingInput?.fullSizeImageURL as URL?)
                                            })
        } else if self.mediaType == .video {
            let options: PHVideoRequestOptions = PHVideoRequestOptions()
            options.version = .original
            PHImageManager.default().requestAVAsset(forVideo: self,
                                                    options: options,
                                                    resultHandler: {(asset: AVAsset?, _, _) -> Void in
                                                        if let urlAsset = asset as? AVURLAsset {
                                                            let localVideoUrl: URL = urlAsset.url as URL
                                                            completionHandler?(localVideoUrl)
                                                        } else {
                                                            completionHandler?(nil)
                                                        }
                                                    })
        }
    }
//    printTime("mediaType [\(asset.mediaType)] mediaSubtypes [\(asset.mediaSubtypes)]")
//    printTime("pixelWidth [\(asset.pixelWidth)] pixelHeight [\(asset.pixelHeight)]")
//    printTime("creationDate [\(asset.creationDate)] modificationDate [\(asset.modificationDate)]")

    @inlinable public var fileName: String {
        let resources = PHAssetResource.assetResources(for: self)
        return resources.first?.originalFilename ?? ""
    }

    @inlinable public var fileSize: UInt64 {
        let resources = PHAssetResource.assetResources(for: self)
        guard let resource = resources.first else { return 0 }
        guard let unsignedInt64 = resource.value(forKey: "fileSize") as? CLong else { return 0 }
        return UInt64(Int64(bitPattern: UInt64(unsignedInt64)))
    }

    @inlinable public var fileSizeString: String {
//        String(format: "%.2f", Double(sizeOnDisk) / (1024.0*1024.0))+" MB"
        return ByteCountFormatter.string(fromByteCount: Int64(fileSize), countStyle: .file)
    }
}

