-- set colorscheme style based on time
local colorscheme_by_time = function()
  local time = tonumber(os.date "%H")
  if time >= 0 and time <= 15 then
    return "slime"
  elseif time >= 16 and time <= 17 then
    return "sunset"
  else
    return "night"
  end
end

local dull = {
  style = colorscheme_by_time(), -- slime, sunset, night or transparent(still experiment)
}
return dull
