class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = appTabBarController
    @window.makeKeyAndVisible

    true
  end

  def appTabBarController
    taskViewController = TaskViewController.alloc.init
    taskViewController.title = "Ajouter"

    listViewController = ListViewController.alloc.initWithStyle(UITableViewStylePlain)
    listViewController.title = "Tâches"

    tabBarController = UITabBarController.alloc.init
    tabBarController.viewControllers = [
      taskViewController,
      UINavigationController.alloc.initWithRootViewController(listViewController)
    ]

    tabBarController
  end
end
