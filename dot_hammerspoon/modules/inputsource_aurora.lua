local boxes = {}
-- 자신이 사용하고 있는 English 인풋 소스 이름을 넣어준다

local inputSource = {
	english = "com.apple.keylayout.ABC",
	-- korean = "org.youknowone.inputmethod.Gureum.han2",
	korean = "com.apple.inputmethod.Korean.2SetKorean",
	japanese = "com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese",
}
local box_height = 24
local box_height1 = 37
local box_alpha = 0.3

local laptopScreen = "Built-in Retina Display"
local upper_color = {}
local under_color = {
	hex = "#ccc",
	alpha = 1,
}

local function reset_boxes()
	boxes = {}
end

local function newBox()
	local box = hs.drawing.rectangle(hs.geometry.rect(x, y, width, height))
	box:setTopLeft(hs.geometry.point(x, y))
	box:setAlpha(box_alpha)
	box:setLevel(hs.drawing.windowLevels.overlay)
	box:setStroke(false)
	box:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces)
	return box
end

function draw_rectangle(target_draw, x, y, width, height, fill_color)
	target_draw:setSize(hs.geometry.rect(x, y, width, height))
	target_draw:setTopLeft(hs.geometry.point(x, y))
	target_draw:setFillColor(fill_color)
	target_draw:setFill(true)
	target_draw:show()
end

local function disable_show()
	for _, box in ipairs(boxes) do
		if box ~= nil then
			box:delete()
		end
	end
	reset_boxes()
end

local function enable_show()
	reset_boxes()
	local screens = hs.screen.allScreens()
	for _, scr in ipairs(screens) do
		local frame = scr:fullFrame()
		local boxHeight = (scr:name() == laptopScreen) and box_height1 or box_height
		local box = newBox(frame.x, frame.y, frame.w, boxHeight)
		table.insert(boxes, box)
	end
end

local displayWatcher = hs.screen.watcher.new(function()
	disable_show()
	enable_show()
end)

---- check input source
-- hs.hotkey.bind({ "cmd" }, "i", function()
-- 	local input_source = hs.keycodes.currentSourceID()
-- 	print(input_source)
-- end)

-- watcher 시작
displayWatcher:start()

-- disable_show()
if hs.keycodes.currentSourceID() ~= inputSource.english then
	-- enable_show()
end

-- input alert
local customStyle = hs.alert.defaultStyle
customStyle.fillColor = { white = 0, alpha = 0.25 }
customStyle.strokeColor = { alpha = 0 }
customStyle.textColor = { white = 1.0, alpha = 1.0 }
customStyle.textSize = 80
customStyle.fadeOutDuration = 0.25

local last_IM_alert_uuid = nil
local last_alerted_IM_ID = nil

function IM_alert()
	local current = hs.keycodes.currentSourceID()
	local language = nil

	if current == inputSource.korean then
		language = " 가 "
	elseif current == inputSource.english then
		language = " A "
	elseif current == inputSource.japanese then
		language = " あ "
	end
	hs.alert.closeSpecific(last_IM_alert_uuid)
	last_IM_alert_uuid = hs.alert.show(language, customStyle, 0.2)
	last_alerted_IM_ID = current
end

hs.keycodes.inputSourceChanged(function()
	-- 입력 소스 변경 이벤트 처리
	local currentSource = hs.keycodes.currentSourceID()
	if currentSource == inputSource.korean then
		upper_color = { hex = "#ffffff", alpha = 1 }
	else
		upper_color = { hex = "#cc4477", alpha = 1 }
	end

	IM_alert()

	if currentSource ~= inputSource.english then
		enable_show()
	else
		disable_show()
	end
end)
