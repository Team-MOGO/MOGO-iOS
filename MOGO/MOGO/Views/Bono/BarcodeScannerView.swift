//
//  BarcodeScannerView.swift
//  MOGO
//
//  Created by 박혜운 on 8/10/24.
//

import SwiftUI
import AVFoundation

struct BarcodeScannerView: UIViewControllerRepresentable {
  var didFindCode: (String) -> Void
  
  init(didFindCode: @escaping (String) -> Void) {
    self.didFindCode = didFindCode
  }
  
  // UIViewControllerRepresentable
  // 생성된 코디네이터는 context라는 이름으로 makeUIViewController나 updateUIViewController 메서드에 전달
  func makeCoordinator() -> Coordinator {
    return Coordinator(parent: self)
  }
  
  func makeUIViewController(context: Context) -> UIViewController {
    let viewController = UIViewController()
    let captureSession = AVCaptureSession()
    
    guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return viewController }
    
    let videoInput: AVCaptureDeviceInput // 카메라 장치로부터 받아오는 입력 값
    
    do {
      videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
    } catch {
      return viewController
    }
    
    if captureSession.canAddInput(videoInput) {
      captureSession.addInput(videoInput)
    } else {
      return viewController
    }
    
    let metadataOutput = AVCaptureMetadataOutput()
    
    if captureSession.canAddOutput(metadataOutput) {
      captureSession.addOutput(metadataOutput)
      metadataOutput.setMetadataObjectsDelegate(context.coordinator, queue: DispatchQueue.main) // metadataOutput이 스캔한 메타데이터를 처리할 객체
      metadataOutput.metadataObjectTypes = [.ean8, .ean13, .upce, .qr] // 스캔할 바코드 유형
    } else {
      return viewController
    }
    
    captureSession.sessionPreset = .photo

    // 카메라 프리뷰
    let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
    // 뷰 컨트롤러 전체에 레이어 크기 맞춤
    previewLayer.frame = viewController.view.layer.bounds
    // 프리뷰 레이어의 영상이 뷰의 경계를 채우도록 비율을 설정합니다.
    previewLayer.videoGravity = .resizeAspectFill
    // 프리뷰 레이어를 뷰 컨트롤러의 뷰에 추가하여 화면에 표시되도록 합니다.
    viewController.view.layer.addSublayer(previewLayer)
    // 카메라 세션을 시작하여 실시간으로 바코드를 스캔할 수 있게 합니다.
    captureSession.startRunning()
    
    return viewController
  }
  
  func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
    // 업데이트가 필요한 경우 추가 코드를 작성
  }
  
  class Coordinator: NSObject, AVCaptureMetadataOutputObjectsDelegate {
    var parent: BarcodeScannerView
    
    init(parent: BarcodeScannerView) {
      self.parent = parent
    }
    
    // MARK: - 카메라로 스캔한 바코드 처리
    func metadataOutput(
      _ output: AVCaptureMetadataOutput,
      didOutput metadataObjects: [AVMetadataObject],
      from connection: AVCaptureConnection
    ) {
      if let metadataObject = metadataObjects.first { // 첫번 째 값
        guard let readableObject = metadataObject as? AVMetadataMachineReadableCodeObject else { return } // 읽을 수 있는 데이터로 변환
        guard let stringValue = readableObject.stringValue else { return }
        
        // 진동 알림
        AudioServicesPlaySystemSound(SystemSoundID(kSystemSoundID_Vibrate))
        parent.didFindCode(stringValue)
      }
    }
  }
}
