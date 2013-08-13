class TaskViewController < UIViewController

  private

  def loadView
    layoutView
  end

  def layoutView
    # Initialisation de la vue
    self.view = UIView.alloc.init

    # Utilisation d'un gris léger en couleur de fond
    self.view.backgroundColor = UIColor.colorWithRed(0.902, green: 0.902, blue: 0.902, alpha: 1.0)

    # Ajout d'un en-tête
    @headerImageView = UIImageView.alloc.initWithFrame([[0, 0], [320, 60]])
    @headerImageView.image = UIImage.imageNamed("bgHeader.png")

    self.view.addSubview(@headerImageView)
  end
end
