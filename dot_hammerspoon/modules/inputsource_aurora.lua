local boxes = {}
-- 자신이 사용하고 있는 English 인풋 소스 이름을 넣어준다

local inputSource = {
	english = "com.apple.keylayout.ABC",
	korean = "org.youknowone.inputmethod.Gureum.han2",
	japanese = "com.apple.inputmethod.Kotoeri.RomajiTyping.Japanese",
}
local box_height = 24
local box_height1 = 37
local box_alpha = 0.3

local laptopScreen = "Built-in Retina Display"

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

-- 입력소스 변경 이벤트에 이벤트 리스너를 달아준다
hs.keycodes.inputSourceChanged(function()
	--상단 color
	upper_color = {}
	if hs.keycodes.currentSourceID() == inputSource.korean then
		upper_color.hex = "#ffffff"
		upper_color.alpha = 1
	else
		upper_color.hex = "#cc4477"
		upper_color.alpha = 1
	end

	IM_alert()
	disable_show()
	if hs.keycodes.currentSourceID() ~= inputSource.english then
		-- enable_show()
	end
end)

--하단color
under_color = {
	hex = "#ccc",
	alpha = 1,
}

function enable_show()
	reset_boxes()
	hs.fnutils.each(hs.screen.allScreens(), function(scr)
		local frame = scr:fullFrame()

		local box = newBox()
		local boxHeight = (scr:name() == laptopScreen) and box_height1 or box_height
		draw_rectangle(box, frame.x, frame.y, frame.w, boxHeight, upper_color)

		table.insert(boxes, box)
	end)
end

function disable_show()
	hs.fnutils.each(boxes, function(box)
		if box ~= nil then
			box:delete()
		end
	end)
	reset_boxes()
end

function newBox()
	return hs.drawing.rectangle(hs.geometry.rect(0, 0, 0, 0))
end

function reset_boxes()
	boxes = {}
end

function draw_rectangle(target_draw, x, y, width, height, fill_color)
	target_draw:setSize(hs.geometry.rect(x, y, width, height))
	target_draw:setTopLeft(hs.geometry.point(x, y))

	target_draw:setFillColor(fill_color)
	target_draw:setFill(true)
	target_draw:setAlpha(box_alpha)
	target_draw:setLevel(hs.drawing.windowLevels.overlay)
	target_draw:setStroke(false)
	target_draw:setBehavior(hs.drawing.windowBehaviors.canJoinAllSpaces)
	target_draw:show()
end

-- input alert
local customStyle = hs.alert.defaultStyle
customStyle.fillColor = { white = 0, alpha = 0.25 }
customStyle.strokeColor = { alpha = 0 }
customStyle.textColor = { white = 1.0, alpha = 1.0 }
customStyle.textSize = 80
customStyle.fadeOutDuration = 0.25

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

	if hs.keycodes.currentSourceID() == last_alerted_IM_ID then
		return
	end

	hs.alert.closeSpecific(last_IM_alert_uuid)
	last_IM_alert_uuid = hs.alert.show(language, customStyle, 0.2)
	last_alerted_IM_ID = hs.keycodes.currentSourceID()
end
