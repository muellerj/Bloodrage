--[[
  Bloodrage
  By: Ollowain.
	Credit: Fury.lua by Bhaerau.
]]--

function Bloodrage_Configuration_Init()
  if (not Bloodrage_Configuration) then
    Bloodrage_Configuration = { };
  end

  if (Bloodrage_Configuration["Debug"] == nil) then
    Bloodrage_Configuration["Debug"] = false;
  end
end

-- Normal Functions

local function Print(msg)
  if (not DEFAULT_CHAT_FRAME) then
    return;
  end
  DEFAULT_CHAT_FRAME:AddMessage(msg);
end

local function Debug(msg)
  if (Bloodrage_Configuration["Debug"]) then
    Print(msg);
  end
end

--------------------------------------------------

function ActiveStance()
  for i = 1, 3 do
    local _, _, active = GetShapeshiftFormInfo(i);
    if (active) then
      return i;
    end
  end
  return nil;
end

function ShieldSlamLearned()
  if UnitClass("player") == "Warrior" then
    local _, _, _, _, ss = GetTalentInfo(3,17);
    if (ss == 1) then
      return true;
    else
      return nil;
    end
  end
end

function Bloodrage()
  if (UnitClass("player") == CLASS_WARRIOR_BLOODRAGE) then
    if ShieldSlamLearned() then
      if ActiveStance() ~= 2 then
        Debug("Changing to def stance");
        CastSpellByName(ABILITY_DEFENSIVE_STANCE_BLOODRAGE);
      else
        Debug("Activating Bloodrage in def");
        CastSpellByName(ABILITY_BLOODRAGE_BLOODRAGE);
      end
    else
      if ActiveStance() ~= 3 then
        Debug("Changing to bersi stance");
        CastSpellByName(ABILITY_BERSERKER_STANCE_BLOODRAGE);
      else
        Debug("Activating Bloodrage in bersi");
        CastSpellByName(ABILITY_BLOODRAGE_BLOODRAGE);
      end
    end
  end
end

-- Chat Handlers

function Bloodrage_SlashCommand(msg)
  local _, _, command, options = string.find(msg, "([%w%p]+)%s*(.*)$");
  if (command) then
    command = string.lower(command);
  end
  if (command == nil or command == "") then
    Bloodrage();
  elseif (command == "debug") then
    if (Bloodrage_Configuration["Debug"]) then
      Bloodrage_Configuration["Debug"] = false;
      Print(BINDING_HEADER_BLOODRAGE .. ": " .. SLASH_BLOODRAGE_DEBUG .. " " .. SLASH_BLOODRAGE_DISABLED .. ".");
    else
      Bloodrage_Configuration["Debug"] = true;
      Print(BINDING_HEADER_BLOODRAGE .. ": " .. SLASH_BLOODRAGE_DEBUG .. " " .. SLASH_BLOODRAGE_ENABLED .. ".");
    end
  else
    Print(SLASH_BLOODRAGE_HELP);
  end
end

-- Event Handlers

function Bloodrage_OnLoad()
  this:RegisterEvent("VARIABLES_LOADED");
  SlashCmdList["BLOODRAGE"] = Bloodrage_SlashCommand;
  SLASH_BLOODRAGE1 = "/bloodrage";
end

function Bloodrage_OnEvent(event)
  if (event == "VARIABLES_LOADED") then
    Bloodrage_Configuration_Init();
  end
end
