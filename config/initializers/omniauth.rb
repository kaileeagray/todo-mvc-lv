Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, "c335dbfcc139da064934", "0d4d506dc8675853a87ca7af4c7db060bc0adb84"
end

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "172131716542195", "3eb99c456280bee56c3d7568b1438ba5"
end
