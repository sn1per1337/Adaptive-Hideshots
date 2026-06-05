local refs = {
    dt = { ui.reference("Rage", "Aimbot", "Double tap") },
    hs = { ui.reference("AA", "Other", "On shot anti-aim") },
}
local tmp = ui.new_label("LUA","B","\n")
local delay = ui.new_slider("LUA","B",  "Safe Slam Delay", 16, 100)
local tmp2 = ui.new_label("LUA","B","\n\n")
local dt1 = false
local dt2 = false
local lc = false
local tickcount = 0
local dt_hideshots = function()
    dt1 = ui.get(refs.dt[2])
    if dt1 ~= dt2 and dt1 == false then
        lc = true
    else
        lc = false
    end
    if lc then 
        tickcount = globals.tickcount()
    end
    if tickcount + ui.get(delay) > globals.tickcount() then
        ui.set(refs.hs[1], false)
    else 
        ui.set(refs.hs[1], true)
    end
    dt2 = ui.get(refs.dt[2])
end
client.set_event_callback("setup_command", function(cmd)
    dt_hideshots()
end)
