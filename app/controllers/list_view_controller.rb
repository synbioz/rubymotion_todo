class ListViewController < UIViewController

  def loadView
    layoutView
  end

  private

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

    # Ajout d'un label pour lister les tâches
    @taskNamesLabel = UILabel.alloc.initWithFrame([[10, 50], [300, 40]])
    @taskNamesLabel.color = UIColor.colorWithRed(0.400, green: 0.400, blue: 0.400, alpha: 1.0)
    @taskNamesLabel.backgroundColor = UIColor.clearColor
    @taskNamesLabel.text = Task.list.map { |task| "#{task.name} (#{task.priority})" }.join(", ")

    self.view.addSubview(@taskNamesLabel)
  end
end
