class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    task_view_controller = TaskViewController.alloc.init

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = task_view_controller
    @window.makeKeyAndVisible

    true
  end
end
