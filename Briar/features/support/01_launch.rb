########################################
#                                      #
#       Important Note                 #
#                                      #
#   When running calabash-ios tests at #
#   www.xamarin.com/test-cloud         #
#   this file will be overwritten by   #
#   a file which automates             #
#   app launch on devices.             #
#                                      #
#   Don't rely on this file being      #
#   present when running at            #
#   Xamarin Test Cloud                 #
#                                      #
########################################

require 'calabash-cucumber/launcher'


# APP_BUNDLE_PATH = "~/Library/Developer/Xcode/DerivedData/??/Build/Products/Calabash-iphonesimulator/??.app"
# You may uncomment the above to overwrite the APP_BUNDLE_PATH
# However the recommended approach is to let Calabash find the app itself
# or set the environment variable APP_BUNDLE_PATH


#noinspection RubyUnusedLocalVariable
Before do |scenario|
  @calabash_launcher = Calabash::Cucumber::Launcher.new
  unless @calabash_launcher.calabash_no_launch?
    dev_dir = `xcode-select --print-path`.strip
    system "/usr/bin/osascript -e 'tell application \"#{dev_dir}/Platforms/iPhoneSimulator.platform/Developer/Applications/iPhone Simulator.app\" to quit'"
    @calabash_launcher.relaunch
    @calabash_launcher.calabash_notify(self)
  end

  backdoor('calabash_backdoor_reset_app:', 'ignorable')
  req_elms = ['tabBar',
              "navigationItemView marked:'Buttons'"]

  msg = 'timed out waiting for backdoor reset'
  wait_for_elements_exist(req_elms,
                          {:timeout => 4.0,
                           :retry_frequency => 0.4,
                           :timeout_message => msg})
  sleep(0.4)

  @cp = nil
  @model = briar_model()
end

#noinspection RubyUnusedLocalVariable
After do |scenario|
  unless @calabash_launcher.calabash_no_stop?
    calabash_exit
    if @calabash_launcher.active?
      @calabash_launcher.stop
    end
  end
end

at_exit do
  launcher = Calabash::Cucumber::Launcher.new
  if launcher.simulator_target?
    Calabash::Cucumber::SimulatorHelper.stop unless launcher.calabash_no_stop?
  end
end
