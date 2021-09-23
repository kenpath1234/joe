local VirtualInput = game:GetService("VirtualInputManager")
local Mouse = game.Players.LocalPlayer:GetMouse()

function PullStandInfo()
    local Path = game:GetService("Players").LocalPlayer.PlayerGui.Interface["profile_Container"].ActiveContainer

    local Stand = string.sub(Path.Stand.Text, 8)
    local Attribute = string.sub(Path.Attribute.Text, 11)
    local Skin = string.sub(Path.Skin.Text, 6)
    
    print(Stand)
    
    
    local Info = {Stand, Attribute, Skin}

    return Info
end

function EmulateMouseClick()
    VirtualInput:SendMouseButtonEvent(Mouse.X, Mouse.Y, 0,true, game, 0)
end

function Roka()
    VirtualInput:SendKeyEvent(true, Enum.KeyCode.Two, false, nil)
    wait(0.5)
    local args = {
        [1] = "Rokakaka",
        [2] = "Eat Rokakaka",
    }

    game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
end

function UseSlot1()
    VirtualInput:SendKeyEvent(true, Enum.KeyCode.One, false, nil)
    wait(0.5)
    EmulateMouseClick()
end

function CheckForStand()
    local Stand = PullStandInfo()
    
    if Stand[1] == "None" then
        print("No")
        return false
    else
        return true
    end
end

function DoStuff()
    local Info = PullStandInfo()
    
    local Stand = Info[1]
    local Attribute = Info[2]
    local Skin = Info[3]
    
    local HasStand = CheckForStand()
    
    if HasStand == true then
        if _G.Specific == false then
            if table.find(_G.Stands, Stand) then
                print("Stopping")
            else
                if table.find(_G.Attributes, Attribute) then
                    print("Stopping")
                else
                    if table.find(_G.Skins, Skin) then
                        print("Stopping")
                    else
                        Roka()
                        wait(3)
                        DoStuff()
                    end
                end
            end
        else
            if table.find(_G.Stands, Stand) and table.find(_G.Attributes, Attribute) and table.find(_G.Skins, Skin) then
                print("Stopping")
            else
                Roka()
                wait(3)
                DoStuff()
            end
        end
    else
        UseSlot1()
        wait(4)
        DoStuff()
    end
end

DoStuff()
