import UIKit


struct Items {
    let image: UIImage
    let text: String
    let descript: String
    let type: ItemType
}

class MoonController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    
    private var collectionView: UICollectionView?
    
    private let moonNav = NavController(header: "Discover")
    private let buttons = MoonButtonsView()
    
    private var dataSource: [Items] = []
    private var selectedFilter: ItemFilter = .all
    private var displayDataSource: [Items] {
        switch selectedFilter {
        case .all:
            return dataSource
        case .ambient:
            return dataSource.filter { item in
                return item.type == .ambient
            }
        case .forKids:
            return dataSource.filter { item in
                return item.type == .forKids
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(moonNav)
        view.addSubview(buttons)
        constraints()
        view.backgroundColor = R.Colors.background
        
        
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical

        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 10
        
        dataSource = [ .init(image: UIImage(named: "cover")!, text: "Guitar Camp", descript: " 7 songs • instrumental", type: .ambient),
                       .init(image: UIImage(named: "cover2")!, text: "Chill-Hop", descript: " 7 songs • instrumental", type: .forKids),
                       .init(image: UIImage(named: "cover3")!, text: "Night Forest", descript: " 7 songs • instrumental", type: .ambient),
                       .init(image: UIImage(named: "cover4")!, text: "Sunrise", descript: " 7 songs • instrumental", type: .forKids),
                       .init(image: UIImage(named: "cover5")!, text: "Starry night", descript: " 7 songs • instrumental", type: .ambient),
                       .init(image: UIImage(named: "cover6")!, text: "Cozy Chill", descript: " 7 songs • instrumental", type: .forKids),
        
        ]
        collectionView?.reloadData()

        //collectionView?.backgroundColor = R.Colors.background
        collectionView = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        
        guard let collectionView = collectionView else { return }
        
        collectionView.register(CardsView.self, forCellWithReuseIdentifier: CardsView.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = R.Colors.background
        collectionView.showsVerticalScrollIndicator = false
        
        view.addSubview(collectionView)
        
        
      
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
                   collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
                   collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                   collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
                   collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
               ])
       
        
        buttons.onFilterChange = { newFilter in
            self.selectedFilter = newFilter
            self.collectionView?.reloadData()
        }
    }
    
    func constraints() {
        buttons.translatesAutoresizingMaskIntoConstraints = false
        moonNav.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moonNav.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            moonNav.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            moonNav.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            buttons.topAnchor.constraint(equalTo: moonNav.bottomAnchor, constant: 40),
            buttons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            
        
        
        ])
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        displayDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CardsView.identifier, for: indexPath) as! CardsView
        
        
        let item = displayDataSource[indexPath.row]
        
       
        
        cell.configure(label: item.text, image: item.image, description: item.descript)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 10) / 2 // Ширина ячейки равна половине доступной ширины минус 10, чтобы оставить отступ между ячейками
        let height: CGFloat = 250 // Высота ячейки равна 100
        
        return CGSize(width: width, height: height)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let _ = collectionView.cellForItem(at: indexPath) as? CardsView {
            let guitar = NavBarController(rootViewController: GuitarController())
//            let guitar = GuitarController()
            let chill = ChillController()
            
            //let array = [guitar,chill]
            guitar.modalPresentationStyle = .overFullScreen // Обновите на этот стиль
            guitar.modalTransitionStyle = .coverVertical
            //navigationController?.navigationBar.backgroundColor = .white
           
            
            //navigationController?.pushViewController(guitar, animated: true)
            
            present(guitar, animated: true)
           
            
            
          
        }
    }
}
    



