local boxes = {}
-- 자신이 사용하고 있는 English 인풋 소스 이름을 넣어준다
local inputEnglish = "com.apple.keylayout.ABC"
local box_height = 24
local box_height1 = 37
local box_alpha = 0.3

local laptopScreen = "Built-in Retina Display"
local GREEN = hs.drawing.color.osx_green

local displayWatcher = hs.screen.watcher.new(function()
	disable_show()
	enable_show()
end)

-- watcher 시작
displayWatcher:start()

-- 입력소스 변경 이벤트에 이벤트 리스너를 달아준다
hs.keycodes.inputSourceChanged(function()
	disable_show()
	if hs.keycodes.currentSourceID() ~= inputEnglish then
		enable_show()
	end
end)

--상단 color
upper_color = {
	hex = "#ffffff",
	alpha = 1,
}

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
