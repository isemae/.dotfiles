-- Reload config automatically
local configFileWatcher
function reloadConfig()
	configFileWatcher:stop()
	configFileWatcher = nil
	hs.reload()
end

configFileWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.config/hammerspoon/", reloadConfig)
configFileWatcher:start()

-- require("modules.auto-reload")
-- require("modules.inputsource_aurora")
require("modules.wheelClickScroll")
-- require("modules.esc_convert_to_eng")

hs.notify.new({ title = "Hammerspoon", subTitle = "Configuration loaded" }):send()
