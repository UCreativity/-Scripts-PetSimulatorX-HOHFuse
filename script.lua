-- //
local Run = game:GetService("RunService").RenderStepped

-- //
local function fuse(pets)
    local toFuse = {}
    for id, c in pairs(pets) do
        table.insert(toFuse, tostring(id))
    end
    workspace.__THINGS.__REMOTES["fuse pets"]:InvokeServer({{
        toFuse[1],
        toFuse[2],
        toFuse[3],
        toFuse[4],
        toFuse[5],
        toFuse[6],
        toFuse[7],
        toFuse[8],
        toFuse[9],
        toFuse[10],
        toFuse[11],
        toFuse[12]
    }})
end
local req = {
    ["rbxassetid://7028818051"] = 2,
    ["rbxassetid://7028817896"] = 4,
    ["rbxassetid://7316798548"] = 6
}

local function getCategoryCount(tbl, cat)
    local i = 0
    for id, c in pairs(tbl) do
        if c == cat then
            i = i + 1
        end
    end
    return i
end

-- //
while Run:Wait() do
    -- //
    local finalPets = {}
    
    -- //
    for _, v in pairs(game:GetService("Players")[tostring(game.Players.LocalPlayer.Character)].PlayerGui.Inventory.Frame.Main.Pets:GetChildren()) do
        if v:FindFirstChild("PetIcon") then
            if req[v.PetIcon.Image] then
                if getCategoryCount(finalPets, v.PetIcon.Image) < req[v.PetIcon.Image] then
                    finalPets[v.Name] = v.PetIcon.Image
                end
            end
        end
    end
    
    -- //
    local total = 0
    for c, count in pairs(req) do
        local has = getCategoryCount(finalPets, c)
        total = total + has
    end
    if total == 12 then
        fuse(finalPets)
    else
        wait(5)
    end
end
