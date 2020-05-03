--[[
SirHurt Dumper made by ArilisDev.

NOTE:
The code specified in curly brackets below was not created by me, I do not take credit whatsoever for that part of the script. I do not know or remember the link for referance.
{
local function lookupify(t)
	local r = {}
	for _, v in pairs(t) do
		r[v] = true
	end
	return r
end

-- All emoji-like codepoint ranges in UTF8
local blockedRanges = {
	{0x0001F601, 0x0001F64F},
	{0x00002702, 0x000027B0},
	{0x0001F680, 0x0001F6C0},
	{0x000024C2, 0x0001F251},
	{0x0001F300, 0x0001F5FF},
	{0x00002194, 0x00002199},
	{0x000023E9, 0x000023F3},
	{0x000025FB, 0x000026FD},
	{0x0001F300, 0x0001F5FF},
	{0x0001F600, 0x0001F636},
	{0x0001F681, 0x0001F6C5},
	{0x0001F30D, 0x0001F567},
}

-- Miscellaneous UTF8 codepoints that should be blocked
local blockedSingles = lookupify {
	0x000000A9,
	0x000000AE,
	0x0000203C,
	0x00002049,
	0x000020E3,
	0x00002122,
	0x00002139,
	0x000021A9,
	0x000021AA,
	0x0000231A,
	0x0000231B,
	0x000025AA,
	0x000025AB,
	0x000025B6,
	0x000025C0,
	0x00002934,
	0x00002935,
	0x00002B05,
	0x00002B06,
	0x00002B07,
	0x00002B1B,
	0x00002B1C,
	0x00002B50,
	0x00002B55,
	0x00003030,
	0x0000303D,
	0x00003297,
	0x00003299,
	0x0001F004,
	0x0001F0CF,
}

function rUnicode(str)
    local codepoints = {}
	
	-- Loop over codepoints in input
	for _, codepoint in utf8.codes(str) do
		
		-- Assume innocent until proven guilty
		local insert = true
		
		-- Check if singular blocked
		if blockedSingles[codepoint] then
			insert = false
		else
			-- Check all ranges
			for _, range in ipairs(blockedRanges) do
				if range[1] <= codepoint and codepoint <= range[2] then
					-- Codepoint is in an emoji range
					insert = false
					break
				end
			end
		end
		
		-- Only insert into table if proven non-emoji
		if insert then
			table.insert(codepoints, codepoint)
		end
	end
	
	-- Return string without emoji codepoints
	return utf8.char(unpack(codepoints))
end
}
--]]

if not LUAPROTECT then game:GetService('Players').LocalPlayer:Kick('Exploit not supported\nSirHurt only!') return end

local version = 'v1.1'
local start = tick()
_G.ScriptsDecompiled = 0

function hijackdecompiler(path)
    local old = decompile(path)
    return old:gsub('-- Decompiled using SirHurt V4', '-- Decompiled using SirHurt V4 | Dumped by the SirHurt Dumper made by ArilisDev')
end

function dumpw(a)
	warn('[SirHurt Dumper '..version..']: '..a)
end

local function lookupify(t)
	local r = {}
	for _, v in pairs(t) do
		r[v] = true
	end
	return r
end

-- All emoji-like codepoint ranges in UTF8
local blockedRanges = {
	{0x0001F601, 0x0001F64F},
	{0x00002702, 0x000027B0},
	{0x0001F680, 0x0001F6C0},
	{0x000024C2, 0x0001F251},
	{0x0001F300, 0x0001F5FF},
	{0x00002194, 0x00002199},
	{0x000023E9, 0x000023F3},
	{0x000025FB, 0x000026FD},
	{0x0001F300, 0x0001F5FF},
	{0x0001F600, 0x0001F636},
	{0x0001F681, 0x0001F6C5},
	{0x0001F30D, 0x0001F567},
}

-- Miscellaneous UTF8 codepoints that should be blocked
local blockedSingles = lookupify {
	0x000000A9,
	0x000000AE,
	0x0000203C,
	0x00002049,
	0x000020E3,
	0x00002122,
	0x00002139,
	0x000021A9,
	0x000021AA,
	0x0000231A,
	0x0000231B,
	0x000025AA,
	0x000025AB,
	0x000025B6,
	0x000025C0,
	0x00002934,
	0x00002935,
	0x00002B05,
	0x00002B06,
	0x00002B07,
	0x00002B1B,
	0x00002B1C,
	0x00002B50,
	0x00002B55,
	0x00003030,
	0x0000303D,
	0x00003297,
	0x00003299,
	0x0001F004,
	0x0001F0CF,
}

function rUnicode(str)
    local codepoints = {}
	
	-- Loop over codepoints in input
	for _, codepoint in utf8.codes(str) do
		
		-- Assume innocent until proven guilty
		local insert = true
		
		-- Check if singular blocked
		if blockedSingles[codepoint] then
			insert = false
		else
			-- Check all ranges
			for _, range in ipairs(blockedRanges) do
				if range[1] <= codepoint and codepoint <= range[2] then
					-- Codepoint is in an emoji range
					insert = false
					break
				end
			end
		end
		
		-- Only insert into table if proven non-emoji
		if insert then
			table.insert(codepoints, codepoint)
		end
	end
	
	-- Return string without emoji codepoints
	return utf8.char(unpack(codepoints))
end

function check(service)
    return game:GetService(service)
end

for _,v in pairs(game:GetService('CoreGui'):GetChildren()) do
    if v.Name == 'DumperStatus' then v:Destroy() end
end

local Status = Instance.new('Hint', check('CoreGui'))
Status.Name = 'DumperStatus'
Status.Text = 'Waiting for game to load.'
repeat wait() until game:IsLoaded()
Status.Text = 'Game loaded.'
wait(1)
Status.Text = 'Setting up dependencies...'
local GameName = string.gsub(string.gsub(rUnicode(game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name), '%s+', ''), '/', '')

makefolder('SirHurt Dumper')
makefolder('SirHurt Dumper/'..GameName)
Status.Text = "Folder '"..GameName.."' has been made..."

function writefile2(a,b)
    writefile('SirHurt Dumper/'..GameName..'/'..a, b)
end

function genfolder(name)
    makefolder('SirHurt Dumper/'..GameName..'/'..name)
    Status.Text = "Creating folder: '"..name
end

genfolder('Workspace')
genfolder('Workspace/LocalScripts')
genfolder('Workspace/ModuleScripts')
genfolder('Players')
genfolder('Players/LocalPlayer')
genfolder('Players/LocalPlayer/PlayerScripts')
genfolder('Players/LocalPlayer/PlayerScripts/LocalScripts')
genfolder('Players/LocalPlayer/PlayerScripts/ModuleScripts')
genfolder('Players/LocalPlayer/PlayerGui')
genfolder('Players/LocalPlayer/PlayerGui/LocalScripts')
genfolder('Players/LocalPlayer/PlayerGui/ModuleScripts')
genfolder('ReplicatedFirst')
genfolder('ReplicatedFirst/LocalScripts')
genfolder('ReplicatedFirst/ModuleScripts')
genfolder('ReplicatedStorage')
genfolder('ReplicatedStorage/LocalScripts')
genfolder('ReplicatedStorage/ModuleScripts')
genfolder('StarterPlayer')
genfolder('StarterPlayer/StarterPlayerScripts')
genfolder('StarterPlayer/StarterPlayerScripts/LocalScripts')
genfolder('StarterPlayer/StarterPlayerScripts/ModuleScripts')


local Workspace = check('Workspace')
local Players = check('Players')
local LocalPlayer = Players.LocalPlayer
local PlayerScripts = LocalPlayer.PlayerScripts
local PlayerGui = LocalPlayer.PlayerGui
local ReplicatedFirst = check('ReplicatedFirst')
local ReplicatedStorage = check('ReplicatedStorage')
local StarterPlayer = check('StarterPlayer')
local StarterPlayerScripts = StarterPlayer.StarterPlayerScripts

Status.Text = 'Looking through workspace...'
wait()
for _,v in pairs(Workspace:GetDescendants()) do
    if v:IsA('LocalScript') then
        pcall(function()
            writefile2('Workspace/LocalScripts/'..v.Name..'.lua', hijackdecompiler(v))
		end)
		dumpw('Workspace/LocalScripts/'..v.Name..'.lua decompiled.')
		_G.ScriptsDecompiled = _G.ScriptsDecompiled + 1
    end
    if v:IsA('ModuleScript') then
        pcall(function()
            writefile2('Workspace/ModuleScripts/'..v.Name..'.lua', hijackdecompiler(v))
		end)
		dumpw('Workspace/ModuleScripts/'..v.Name..'.lua decompiled.')
		_G.ScriptsDecompiled = _G.ScriptsDecompiled + 1
    end
end

Status.Text = 'Looking through LocalPlayer/PlayerScripts...'
wait()

for _,v in pairs(PlayerScripts:GetDescendants()) do
	if v:IsA('LocalScript') then
        pcall(function()
            writefile2('Players/LocalPlayer/PlayerScripts/LocalScripts/'..v.Name..'.lua', hijackdecompiler(v))
		end)
		dumpw('Players/LocalPlayer/PlayerScripts/LocalScripts/'..v.Name..'.lua decompiled.')
		_G.ScriptsDecompiled = _G.ScriptsDecompiled + 1
    end
	if v:IsA('ModuleScript') then
        pcall(function()
            writefile2('Players/LocalPlayer/PlayerScripts/ModuleScripts/'..v.Name..'.lua', hijackdecompiler(v))
		end)
		dumpw('Players/LocalPlayer/PlayerScripts/ModuleScripts/'..v.Name..'.lua decompiled.')
		_G.ScriptsDecompiled = _G.ScriptsDecompiled + 1
    end
end

Status.Text = 'Looking through LocalPlayer/PlayerGui...'
wait()

for _,v in pairs(PlayerGui:GetDescendants()) do
	if v:IsA('LocalScript') then
        pcall(function()
            writefile2('Players/LocalPlayer/PlayerGui/LocalScripts/'..v.Name..'.lua', hijackdecompiler(v))
		end)
		dumpw('Players/LocalPlayer/PlayerGui/LocalScripts/'..v.Name..'.lua decompiled.')
		_G.ScriptsDecompiled = _G.ScriptsDecompiled + 1
    end
	if v:IsA('ModuleScript') then
        pcall(function()
            writefile2('Players/LocalPlayer/PlayerGui/ModuleScripts/'..v.Name..'.lua', hijackdecompiler(v))
		end)
		dumpw('Players/LocalPlayer/PlayerGui/ModuleScripts/'..v.Name..'.lua decompiled.')
		_G.ScriptsDecompiled = _G.ScriptsDecompiled + 1
    end
end

Status.Text = 'Looking through StarterPlayer/StarterPlayerScripts...'
wait()

for _,v in pairs(StarterPlayerScripts:GetDescendants()) do
	if v:IsA('LocalScript') then
        pcall(function()
            writefile2('StarterPlayer/StarterPlayerScripts/LocalScripts/'..v.Name..'.lua', hijackdecompiler(v))
		end)
		dumpw('StarterPlayer/StarterPlayerScripts/LocalScripts/'..v.Name..'.lua decompiled.')
		_G.ScriptsDecompiled = _G.ScriptsDecompiled + 1
    end
	if v:IsA('ModuleScript') then
        pcall(function()
            writefile2('StarterPlayer/StarterPlayerScripts/ModuleScripts/'..v.Name..'.lua', hijackdecompiler(v))
		end)
		dumpw('StarterPlayer/StarterPlayerScripts/ModuleScripts/'..v.Name..'.lua decompiled.')
		_G.ScriptsDecompiled = _G.ScriptsDecompiled + 1
    end
end

Status.Text = 'Looking through ReplicatedFirst...'
wait()

for _,v in pairs(ReplicatedFirst:GetDescendants()) do
	if v:IsA('LocalScript') then
        pcall(function()
            writefile2('ReplicatedFirst/LocalScripts/'..v.Name..'.lua', hijackdecompiler(v))
		end)
		dumpw('ReplicatedFirst/LocalScripts/'..v.Name..'.lua decompiled.')
		_G.ScriptsDecompiled = _G.ScriptsDecompiled + 1
    end
	if v:IsA('ModuleScript') then
        pcall(function()
            writefile2('ReplicatedFirst/ModuleScripts/'..v.Name..'.lua', hijackdecompiler(v))
		end)
		dumpw('ReplicatedFirst/ModuleScripts/'..v.Name..'.lua decompiled.')
		_G.ScriptsDecompiled = _G.ScriptsDecompiled + 1
    end
end

Status.Text = 'Looking through ReplicatedStorage...'
wait()

for _,v in pairs(ReplicatedStorage:GetDescendants()) do
	if v:IsA('LocalScript') then
        pcall(function()
            writefile2('ReplicatedStorage/LocalScripts/'..v.Name..'.lua', hijackdecompiler(v))
		end)
		dumpw('ReplicatedStorage/LocalScripts/'..v.Name..'.lua decompiled.')
		_G.ScriptsDecompiled = _G.ScriptsDecompiled + 1
    end
	if v:IsA('ModuleScript') then
        pcall(function()
            writefile2('ReplicatedStorage/ModuleScripts/'..v.Name..'.lua', hijackdecompiler(v))
		end)
		dumpw('ReplicatedStorage/ModuleScripts/'..v.Name..'.lua decompiled.')
		_G.ScriptsDecompiled = _G.ScriptsDecompiled + 1
    end
end

Status.Text = 'Dumper Finished... Total Time: '..math.floor(tick() - start)..'s... Scripts Decompiled: '.._G.ScriptsDecompiled..'...'
dumpw('Dumper Finished... Total Time: '..math.floor(tick() - start)..'s... Scripts Decompiled: '.._G.ScriptsDecompiled..'...')
wait(10)
Status:Destroy()
