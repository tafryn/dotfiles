-- A catch-all for widgets that haven't gotten big enough to warrant
-- their own file.

function system(cmd)
        local fd = io.popen(cmd)
        local value = fd:read()
        fd:close()
        return value
end

function volume_info(widget_color)
	local vol = io.popen('mpc volume')
	for line in vol:lines() do
		if line:match("%%") then
			volume = line:match("(%d+%%)")
		end
	end
	vol:close()
	return 'ᐊ): '..markup.fg(widget_color, volume)
end

function temperature_info(widget_color)
	local temp = io.popen('sensors')
	for line in temp:lines() do
		if line:match("temp1") then
			temperature = line:match("(%d+%.%d°)C")
		end
	end
	temp:close()
	return '▣: '..markup.fg(widget_color, temperature)
end

function clock_info(widget_color, dateformat, timeformat)
	local date = os.date(dateformat)
	local time = os.date(timeformat)
	return date..spacer..markup.fg(widget_color, time)
end

-- Borrowed from someone, can't remember who.
function usefuleval(s)
	local f, err = loadstring("return "..s);
	if not f then
		f, err = loadstring(s);
	end
	
	if f then
		setfenv(f, _G);
		local ret = { pcall(f) };
		if ret[1] then
			-- Ok
			table.remove(ret, 1)
			local highest_index = #ret;
			for k, v in pairs(ret) do
				if type(k) == "number" and k > highest_index then
					highest_index = k;
				end
				ret[k] = select(2, pcall(tostring, ret[k])) or "<no value>";
			end
			-- Fill in the gaps
			for i = 1, highest_index do
				if not ret[i] then
					ret[i] = "nil"
				end
			end
			if highest_index > 0 then
				mypromptbox[mouse.screen].text = awful.util.escape("Result"..(highest_index > 1 and "s" or "")..": "..tostring(table.concat(ret, ", ")));
			else
				mypromptbox[mouse.screen].text = "Result: Nothing";
			end
		else
			err = ret[2];
		end
	end
	if err then
		mypromptbox[mouse.screen].text = awful.util.escape("Error: "..tostring(err));
	end
end

spacer = ' '
divider = ' |  '
--divider = ' ❙ '
widget_spacer_l = widget({type = "textbox", align = "left" })
widget_spacer_l.text = spacer
widget_spacer_r = widget({type = "textbox", align = "right" })
widget_spacer_r.text = spacer
widget_divider_l = widget({ type = "textbox", align = "left" })
widget_divider_l.text = markup.fg("#ffffff", divider)
widget_divider_r = widget({ type = "textbox", align = "right" })
widget_divider_r.text = markup.fg("#ffffff", divider)
