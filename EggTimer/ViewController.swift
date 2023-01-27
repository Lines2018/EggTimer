import SwiftUI

class ViewController: UIViewController {

    let stack = UIStackView()
    let progressBar: UIProgressView = {
        $0.progress = 0.5
        $0.progressTintColor = .yellow
        $0.trackTintColor = .darkGray
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        
        return $0
    }(UIProgressView())
    
    let titleLabel: UILabel = {
        $0.font = .systemFont(ofSize: 30)
        $0.text = "How do you like your eggs?"
        $0.textAlignment = .center
        $0.textColor = .darkGray
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.7960784314, green: 0.9490196078, blue: 0.9882352941, alpha: 1)
        view.addSubview(stack)
        stack.axis = .vertical
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.addArrangedSubview(titleLabel)
        let titles = ["Soft", "Medium", "Hard"]
        let eggStack = UIStackView()
        eggStack.axis = .horizontal
        eggStack.distribution = .fillEqually
        for i in 0..<3 {
            let title = titles[i]
            let egg = EggView()
            egg.config(self, action: #selector(hardnessSelected), with: title)
            eggStack.addArrangedSubview(egg)
        }
        stack.addArrangedSubview(eggStack)
        let progressView = UIView()
        progressView.addSubview(progressBar)
        stack.addArrangedSubview(progressView)
        stack.distribution = .fillEqually
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 1),
            stack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.leadingAnchor, multiplier: 5),
            view.safeAreaLayoutGuide.trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 5),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: stack.bottomAnchor, multiplier: 1),
            progressBar.leadingAnchor.constraint(equalToSystemSpacingAfter: progressView.leadingAnchor, multiplier: 1),
            progressView.trailingAnchor.constraint(equalToSystemSpacingAfter: progressBar.trailingAnchor, multiplier: 1),
            progressView.bottomAnchor.constraint(equalToSystemSpacingBelow: progressBar.bottomAnchor, multiplier: 1),
            progressBar.heightAnchor.constraint(equalToConstant: 5)
            
        ])
    }

    @objc func hardnessSelected(_ sender: UIButton) {
        guard let title = sender.currentTitle else { return }
        print(title)
    }

}

struct ViewControllerRepresentable_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
            .ignoresSafeArea()
    }
}
