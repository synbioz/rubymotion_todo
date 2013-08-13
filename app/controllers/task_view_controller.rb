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

    # Ajout d'un titre à l'image d'en-tête
    @headerTitle = UILabel.alloc.initWithFrame([[0, 0], [320, 50]])
    @headerTitle.text = "RubyMotion Todo"
    @headerTitle.color = UIColor.colorWithRed(0.702, green: 0.702, blue: 0.702, alpha: 1.000)
    @headerTitle.backgroundColor = UIColor.clearColor
    @headerTitle.textAlignment = UITextAlignmentCenter
    @headerTitle.font = UIFont.fontWithName("AvenirNext-Bold", size: 25)

    self.view.addSubview(@headerTitle)
  end
end
