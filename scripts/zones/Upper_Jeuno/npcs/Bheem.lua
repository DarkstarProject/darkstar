-----------------------------------
-- Area: Upper Jeuno
-- !pos: -90 0 169 244
----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Upper_Jeuno/TextIDs")
-----------------------------------

function onTrade(player,npc,trade)
end

function DECtoHEX(IN)
    local B,K,OUT,I,D=16,"0123456789ABCDEF","",0
    while IN>0 do
        I=I+1
        IN,D=math.floor(IN/B),math.mod(IN,B)+1
        OUT=string.sub(K,D,D)..OUT
    end
    return OUT
end

function fellowParam(player)
    local FellowPersona = player:getFellowPersonality()
    local faceHEX = DECtoHEX(player:getFellowFace())
    local sizeHEX = DECtoHEX(player:getFellowSize()*4)
    local personaHEX  -- these aren't in any kind of sensical pattern that I can find : SE Logic
    if (FellowPersona == 0) then
        personaHEX = "04"  -- 4 {R}
    elseif (FellowPersona == 1) then
        personaHEX = "08"  -- 8
    elseif (FellowPersona == 2) then
        personaHEX = "0C"  -- 12
    elseif (FellowPersona == 3) then
        personaHEX = "10"  -- 16 {R}
    elseif (FellowPersona == 4) then
        personaHEX = "28"  -- 40 {R}
    elseif (FellowPersona == 5) then
        personaHEX = "2C"  -- 44 {R}
    elseif (FellowPersona == 6) then
        personaHEX = "14"  -- 20 {R}
    elseif (FellowPersona == 7) then
        personaHEX = "18"  -- 24 {R}
    elseif (FellowPersona == 8) then
        personaHEX = "1C"  -- 28 {R}
    elseif (FellowPersona == 9) then
        personaHEX = "20"  -- 32
    elseif (FellowPersona == 10) then
        personaHEX = "24"  -- 36
    elseif (FellowPersona == 11) then
        personaHEX = "30"  -- 48 {R}
    end
    local nameHEX = DECtoHEX(player:getFellowNameId())
    local HEXparam = "0x"..faceHEX..""..sizeHEX..""..personaHEX..""..nameHEX..""
    return HEXparam
end
function onTrigger(player,npc)
    local FellowName = player:getFellowNameId()
    local FellowPersona = player:getFellowPersonality()
    local FellowFace = player:getFellowFace()
    local FellowSize = player:getFellowSize()

print("FellowParam = " .. fellowParam(player))

    local FellowQuest = player:getVar("[Quest]Unlisted_Qualities")
    if player:getQuestStatus(JEUNO,UNLISTED_QUALITIES) == QUEST_ACCEPTED and FellowQuest < 7 then
        player:startEvent(10037)
    elseif player:getQuestStatus(JEUNO,UNLISTED_QUALITIES) == QUEST_ACCEPTED and FellowQuest == 7 then
        player:startEvent(10171,0,0,0,0,0,0,0,fellowParam(player))
    else
        player:startEvent(157)
    end
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 10171 then
        player:setMaskBit(player:getVar("[Quest]Unlisted_Qualities"),"[Quest]Unlisted_Qualities",3,true)
    end
end