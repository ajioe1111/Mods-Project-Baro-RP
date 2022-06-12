if SERVER then
    ProjectBaro = {}
    ProjectBaro.Path = table.pack(...)[1]

	dofile(ProjectBaro.Path .. "/Lua/webhook.lua")
	dofile(ProjectBaro.Path .. "/Lua/chatlog.lua")
	dofile(ProjectBaro.Path .. "/Lua/suicide.lua")
	dofile(ProjectBaro.Path .. "/Lua/Nominal_items.lua")
end
