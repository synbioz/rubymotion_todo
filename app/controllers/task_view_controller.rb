class TaskViewController < UIViewController

  def textFieldShouldReturn(textfield)
    textfield.resignFirstResponder
    return true
  end

  def addTask(sender)
    task = Task.new
    task.name = @titleTextField.text

    priority_index = @prioritySegmentedControl.selectedSegmentIndex
    task.priority = @priorityValues[priority_index]

    @titleTextField.text = ""
    @prioritySegmentedControl.selectedSegmentIndex = 0

    @listViewController = ListViewController.alloc.init
    @listViewController.view.frame = self.view.frame

    UIView.transitionFromView(self.view,
                              toView: @listViewController.view,
                              duration: 0.5,
                              options: UIViewAnimationOptionTransitionFlipFromLeft,
                              completion: nil)
  end

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

    # Ajout du champ texte pour le nom de la tâche
    @titleTextField = UITextField.alloc.initWithFrame([[10, 75], [300, 45]])
    @titleTextField.background = UIImage.imageNamed("bgTextField.png")
    @titleTextField.textColor = UIColor.colorWithRed(0.451, green:0.451, blue:0.451, alpha:1.0)
    @titleTextField.font = UIFont.fontWithName("AvenirNextCondensed-DemiBold", size:25)
    @titleTextField.textAlignment = UITextAlignmentCenter
    @titleTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter
    @titleTextField.placeholder = "Nom de la tâche"

    @titleTextField.delegate = self

    self.view.addSubview(@titleTextField)

    # Ajout d'un label pour la priorité
    @prorityLabel = UILabel.alloc.initWithFrame([[10, 140], [300, 30]])
    @prorityLabel.text = "Priorité"
    @prorityLabel.color = UIColor.colorWithRed(0.400, green: 0.400, blue: 0.400, alpha: 1.0)
    @prorityLabel.backgroundColor = UIColor.clearColor
    @prorityLabel.font = UIFont.fontWithName("AvenirNext-DemiBold", size: 20)
    @prorityLabel.textAlignment = UITextAlignmentCenter

    self.view.addSubview(@prorityLabel)

    # Ajout d'un sélecteur de priorité
    @priorityValues = ["Bas", "Haut"]

    @prioritySegmentedControl = UISegmentedControl.alloc.initWithItems(@priorityValues)
    @prioritySegmentedControl.frame = [[10, 170], [300, 30]]
    @prioritySegmentedControl.selectedSegmentIndex = 0

    self.view.addSubview(@prioritySegmentedControl)

    # Ajout du bouton de soumission du formulaire
    @validateButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @validateButton.frame = CGRectMake(10, 400, 300, 40)

    @validateButton.setBackgroundImage(UIImage.imageNamed("btnValidate.png"), forState:UIControlStateNormal)
    @validateButton.setTitle("Valider", forState: UIControlStateNormal)
    @validateButton.setTitleColor(UIColor.whiteColor, forState: UIControlStateNormal)
    @validateButton.titleLabel.font = UIFont.fontWithName("AvenirNext-DemiBold", size: 20)

    @validateButton.addTarget(self,
                              action: "addTask:",
                              forControlEvents: UIControlEventTouchUpInside)

    self.view.addSubview(@validateButton)
  end
end
