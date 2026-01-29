 local function        
                                                                        _0xdecode(s) local b=                           
                                                                                                                                  
                                                                "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";     
                                                            local d="";s=string.gsub(s,"[^"   .. b   .. "=]" ,"");s=string.gsub(s,".",    
                                                          function(x) if (x=="=") then return "";end local r,f="",b:find(x) -1 ;for i=6,1,  
                                                        -1 do r=r   .. (((((f%(2^i)) -(f%(2^(i-1))))>0) and "1") or "0") ;end return r;end);d 
                                                      =string.gsub(s,"%d%d%d?%d?%d?%d?%d?%d?",function(x) if ( #x~=8) then return "";end local  
                                                    c=0;for i=1,8 do c=c + (((x:sub(i,i)=="1") and (2^(8 -i))) or 0) ;end return string.char(c);  
                                                  end);return d;end local _0xn1=100;local _0xn4=255;local _0xn5=6;local _0xn6=8;local _0xn7=4;local 
                                                   _0xn8=1;local _0xn9=0;local _0xn11=2;local _0xn12=3;local _0xn14=0.05;local _0xn15= -0.1;local     
                                                _0xn16= -0.05;local _0xn17=24;local _0xn18=4.5;local _0xn19=1.2;local _0xn20=320;local _0xn21=160;local 
                                                 _0xn22=10;local _0xn23=20;local _0xn24=30;local _0xn25=45;local _0xn26=260;local _0xn27=90;local _0xn28= 
                                              16;local _0xn29=60;local _0xn30=12;local _0xn31=14;local _0xn32=50;local _0xn33=120;local _0xn34=70;local     
                                              _0xn35=250;local _0xn36=0.5;local _0xn37=0.2;local _0xn38=0.25;local _0xn39=0.4;local _0xn40=0.8;local _0xn41 
                                            =0.9;local _0xn42=25;local _0xn43=300;local _0x52a0d5={BulletSpread={Enabled=true,Amount=_0xn9}};local _0x9ba38e; 
                                            _0x9ba38e=hookfunction(math.random,function(...) local args={...};if checkcaller() then return _0x9ba38e(...);end   
                                          if (( #args==_0xn9) or ((args[_0xn8]==_0xn16) and (args[_0xn11]==_0xn14)) or (args[_0xn8]==_0xn15) or (args[_0xn8]==    
                                          _0xn16)) then if _0x52a0d5.BulletSpread.Enabled then return _0x9ba38e(...) * (_0x52a0d5.BulletSpread.Amount/_0xn1) ;end   
                                          end return _0x9ba38e(...);end);local Players=game:GetService(_0xdecode("UGxheWVycw=="));local TweenService=game:GetService( 
                                          _0xdecode("VHdlZW5TZXJ2aWNl"));local UIS=game:GetService(_0xdecode("VXNlcklucHV0U2VydmljZQ=="));local Lighting=game:        
                                        GetService(_0xdecode("TGlnaHRpbmc="));local CoreGui=game:GetService(_0xdecode("Q29yZUd1aQ=="));local gui=Instance.new(_0xdecode 
                                        ("U2NyZWVuR3Vp"));gui.IgnoreGuiInset=true;gui.ResetOnSpawn=false;gui. --[[==============================]]Name=_0xdecode(         
                                        "U3ByZWFkVUk=");gui.Parent=CoreGui;local blur=Instance.new( --[[============================================]]_0xdecode(          
                                        "Qmx1ckVmZmVjdA=="));blur.Size=_0xn9;blur.Parent=       --[[======================================================]]Lighting;local  
                                      frame=Instance.new(_0xdecode("RnJhbWU="));frame.Size= --[[==========================================================]]UDim2.new(_0xn9,  
                                      _0xn20,_0xn9,_0xn21);frame.Position=UDim2.new(      --[[==============================================================]]_0xn36, -_0xn21 
                                      ,_0xn40, -(_0xn21/_0xn11));frame.AnchorPoint=       --[[================================================================]]Vector2.new(    
                                      _0xn9,_0xn9);frame.BackgroundColor3=Color3.fromRGB( --[[==================================================================]]_0xn42,_0xn42 
                                      ,_0xn42);frame.BorderSizePixel=_0xn9;frame.Parent=  --[[==================================================================]]gui;Instance.     
                                    new(_0xdecode("VUlDb3JuZXI="),frame).CornerRadius=    --[[====================================================================]]UDim.new(     
                    _0xn9,_0xn30);local title=Instance.new(_0xdecode("VGV4dExhYmVs"));    --[[====================================================================]]title.Size=     
              UDim2.new(_0xn8, -_0xn23,_0xn9,_0xn24);title.Position=UDim2.new(_0xn9,      --[[======================================================================]]_0xn22,_0xn9, 
            _0xn2);title.Text=_0xdecode("U3ByZWFkIENvbnRyb2xsZXI=");title.TextColor3=     --[[======================================================================]]Color3.       
          fromRGB(_0xn4,_0xn4,_0xn4);title.TextSize=_0xn28;title.Font=Enum.Font.          --[[======================================================================]]GothamBold;   
        title.BackgroundTransparency=_0xn8;title.TextXAlignment=Enum.TextXAlignment.Left; --[[======================================================================]]title.Parent= 
        frame;local dragging=false;local dragStart;local startPos;title.InputBegan:       --[[======================================================================]]Connect(      
      function(input) if (input.UserInputType==Enum.UserInputType.MouseButton1) then      --[[======================================================================]]dragging=true 
      ;dragStart=input.Position;startPos=frame.Position;end end);UIS.InputEnded:Connect(    --[[==================================================================]]function(input) 
       if (input.UserInputType==Enum.UserInputType.MouseButton1) then dragging=false;end    --[[================================================================]]end);UIS.         
    InputChanged:Connect(function(input) if (dragging and (input.UserInputType==Enum.       --[[==============================================================]]UserInputType.    
    MouseMovement)) then local delta=input.Position-dragStart ;frame.Position=UDim2.new(      --[[==========================================================]]startPos.X.Scale,   
    startPos.X.Offset + delta.X ,startPos.Y.Scale,startPos.Y.Offset + delta.Y );end end);local  --[[====================================================]]valueLabel=Instance.new 
    (_0xdecode("VGV4dExhYmVs"));valueLabel.Size=UDim2.new(_0xn8, -_0xn23,_0xn9,_0xn23);valueLabel --[[==============================================]].Position=UDim2.new(_0xn9 
    ,_0xn22,_0xn9,_0xn25);valueLabel.Text=_0xdecode("U3ByZWFkIEFtb3VudDogMA==");valueLabel.TextColor3 --[[====================================]]=Color3.fromRGB(_0xn4,_0xn4,  
    _0xn4);valueLabel.TextSize=_0xn31;valueLabel.Font=Enum.Font.Gotham;valueLabel.BackgroundTransparency= --[[========================]]_0xn8;valueLabel.TextXAlignment=Enum. 
    TextXAlignment.Left;valueLabel.Parent=frame;local slider=Instance.new(_0xdecode("RnJhbWU="));slider.Size=UDim2.new(_0xn9,_0xn26,_0xn9,_0xn6);slider.Position=UDim2.new( 
  _0xn9,_0xn23,_0xn9,_0xn27);slider.BackgroundColor3=Color3.fromRGB(_0xn29,_0xn29,_0xn29);slider.BorderSizePixel=_0xn9;slider.Parent=frame;Instance.new(_0xdecode(        
  "VUlDb3JuZXI="),slider).CornerRadius=UDim.new(_0xn9,_0xn7);local knob=Instance.new(_0xdecode("RnJhbWU="));knob.Size=UDim2.new(_0xn9,_0xn28,_0xn9,_0xn17);knob.        
  Position=UDim2.new(_0xn9, -_0xn5, -_0xn40,_0xn9);knob.BackgroundColor3=Color3.fromRGB(_0xn4,_0xn33,_0xn32);knob.BorderSizePixel=_0xn9;knob.Parent=slider;Instance.new(  
  _0xdecode("VUlDb3JuZXI="),knob).CornerRadius=UDim.new(_0xn8,_0xn9);local watermark=Instance.new(_0xdecode("VGV4dExhYmVs"));watermark.Size=UDim2.new(_0xn8, -_0xn24,     
  _0xn9,_0xn23);watermark.Position=UDim2.new(_0xn9,_0xn9,_0xn9,_0xn22);watermark.Text=_0xdecode("U2tpZGRlZCBieSB5aWdpdHN0eHI=");watermark.TextColor3=Color3.fromRGB(_0xn4 
  ,_0xn4,_0xn4);watermark.TextSize=_0xn30;watermark.Font=Enum.Font.Gotham;watermark.BackgroundTransparency=_0xn8;watermark.TextXAlignment=Enum.TextXAlignment.Right;      
  watermark.Parent=frame;local _0x803b7f=false;knob.InputBegan:Connect(function(input) if (input.UserInputType==Enum.UserInputType.MouseButton1) then _0x803b7f=true;end  
  end);UIS.InputEnded:Connect(function(input) if (input.UserInputType==Enum.UserInputType.MouseButton1) then _0x803b7f=false;end end);UIS.InputChanged:Connect(function(  
  input) if (_0x803b7f and (input.UserInputType==Enum.UserInputType.MouseMovement)) then local relX=math.clamp((input.Position.X-slider.AbsolutePosition.X)/slider.       
  AbsoluteSize.X ,_0xn9,_0xn8);knob.Position=UDim2.new(relX, -_0xn5, -_0xn40,_0xn9);local spreadValue=math.floor(relX * _0xn1 );_0x52a0d5.BulletSpread.Amount=spreadValue 
  ;valueLabel.Text=_0xdecode("U3ByZWFkIEFtb3VudDog")   .. _0xdecode("IA==")   .. spreadValue ;end end);
