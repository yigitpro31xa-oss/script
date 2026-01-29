-- Velocity Safe Obfuscated Version
local function _0xd(s)
    local b='ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'
    local d=''
    s=s:gsub('[^'..b..'=]','')
    s=s:gsub('.',function(x)
        if x=='=' then return '' end
        local r,f='',(b:find(x)-1)
        for i=6,1,-1 do
            r=r..((f%2^i-f%2^(i-1)>0) and '1' or '0')
        end
        return r
    end)
    d=s:gsub('%d%d%d?%d?%d?%d?%d?%d?',function(x)
        if #x~=8 then return '' end
        local c=0
        for i=1,8 do
            c=c+(x:sub(i,i)=='1' and 2^(8-i) or 0)
        end
        return string.char(c)
    end)
    return d
end

local _n={100,255,6,8,4,1,0,2,3,0.05,-0.1,-0.05,24,4.5,1.2,320,160,10,20,30,45,260,90,16,60,12,14,50,120,70,250,0.5,0.2,0.25,0.4,0.8,0.9,25,300}

local spread={Enabled=true,Amount=_n[7]}
local old
old=hookfunction(math.random,function(...)
    local a={...}
    if checkcaller() then return old(...) end
    if (#a==_n[7]) or (a[1]==_n[12] and a[2]==_n[10]) or (a[1]==_n[11]) or (a[1]==_n[12]) then
        if spread.Enabled then
            return old(...) * (spread.Amount/_n[1])
        end
    end
    return old(...)
end)

local Players=game:GetService(_0xd('UGxheWVycw=='))
local Tween=game:GetService(_0xd('VHdlZW5TZXJ2aWNl'))
local UIS=game:GetService(_0xd('VXNlcklucHV0U2VydmljZQ=='))
local Lighting=game:GetService(_0xd('TGlnaHRpbmc='))
local CoreGui=game:GetService(_0xd('Q29yZUd1aQ=='))

local gui=Instance.new(_0xd('U2NyZWVuR3Vp'))
gui.IgnoreGuiInset=true
gui.ResetOnSpawn=false
gui.Name=_0xd('U3ByZWFkVUk=')
gui.Parent=CoreGui

local frame=Instance.new(_0xd('RnJhbWU='))
frame.Size=UDim2.new(0,_n[17],0,_n[18])
frame.Position=UDim2.new(0.5,-_n[18],0.8,-(_n[18]/2))
frame.BackgroundColor3=Color3.fromRGB(_n[38],_n[38],_n[38])
frame.BorderSizePixel=0
frame.Parent=gui
Instance.new(_0xd('VUlDb3JuZXI='),frame).CornerRadius=UDim.new(0,_n[26])

local title=Instance.new(_0xd('VGV4dExhYmVs'))
title.Size=UDim2.new(1,-_n[19],0,_n[20])
title.Position=UDim2.new(0,_n[19],0,_n[5])
title.Text=_0xd('U3ByZWFkIENvbnRyb2xsZXI=')
title.TextColor3=Color3.fromRGB(255,255,255)
title.TextSize=_n[24]
title.Font=Enum.Font.GothamBold
title.BackgroundTransparency=1
title.Parent=frame

-- Drag only title
local dragging=false
local dragStart,startPos

title.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        dragging=true
        dragStart=i.Position
        startPos=frame.Position
    end
end)

UIS.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        dragging=false
    end
end)

UIS.InputChanged:Connect(function(i)
    if dragging and i.UserInputType==Enum.UserInputType.MouseMovement then
        local delta=i.Position-dragStart
        frame.Position=UDim2.new(startPos.X.Scale,startPos.X.Offset+delta.X,startPos.Y.Scale,startPos.Y.Offset+delta.Y)
    end
end)

local value=Instance.new(_0xd('VGV4dExhYmVs'))
value.Size=UDim2.new(1,-_n[19],0,_n[19])
value.Position=UDim2.new(0,_n[19],0,_n[21])
value.Text=_0xd('U3ByZWFkIEFtb3VudDogMA==')
value.TextColor3=Color3.fromRGB(255,255,255)
value.TextSize=_n[25]
value.Font=Enum.Font.Gotham
value.BackgroundTransparency=1
value.Parent=frame

local slider=Instance.new(_0xd('RnJhbWU='))
slider.Size=UDim2.new(0,_n[22],0,_n[6])
slider.Position=UDim2.new(0,_n[19],0,_n[23])
slider.BackgroundColor3=Color3.fromRGB(60,60,60)
slider.Parent=frame
Instance.new(_0xd('VUlDb3JuZXI='),slider).CornerRadius=UDim.new(0,_n[7])

local knob=Instance.new(_0xd('RnJhbWU='))
knob.Size=UDim2.new(0,_n[24],0,_n[13])
knob.Position=UDim2.new(0,-_n[3],-0.8,0)
knob.BackgroundColor3=Color3.fromRGB(255,120,50)
knob.Parent=slider
Instance.new(_0xd('VUlDb3JuZXI='),knob).CornerRadius=UDim.new(1,0)

local draggingKnob=false
knob.InputBegan:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        draggingKnob=true
    end
end)

UIS.InputEnded:Connect(function(i)
    if i.UserInputType==Enum.UserInputType.MouseButton1 then
        draggingKnob=false
    end
end)

UIS.InputChanged:Connect(function(i)
    if draggingKnob and i.UserInputType==Enum.UserInputType.MouseMovement then
        local relX=math.clamp((i.Position.X-slider.AbsolutePosition.X)/slider.AbsoluteSize.X,0,1)
        knob.Position=UDim2.new(relX,-_n[3],-0.8,0)
        local val=math.floor(relX*_n[1])
        spread.Amount=val
        value.Text=_0xd('U3ByZWFkIEFtb3VudDog').." "..val
    end
end)
