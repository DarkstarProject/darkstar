---------------------------------------------------------------------------------------------------
-- func: animatenpc
-- desc: Changes the animation of the given npc. (For testing purposes.)
---------------------------------------------------------------------------------------------------

require("scripts/globals/status");

cmdprops =
{
    permission = 1,
    parameters = "ss"
};

function onTrigger(player, npcId, animationId)

    npcId = tonumber(npcId) or npcId;
    animationId = tonumber(animationId) or _G[animationId];
    
    if (npcId ~= nil and animationId ~= nil) then
        local npc = GetNPCByID( npcId, player );
        if (npc == nil) then return; end

        local oldAnimiation = npc:getAnimation();
        npc:setAnimation( animationId );

        player:PrintToPlayer(string.format("NPC ID: %i - %s | Old animation: %i | New animation: %i\n", npcId, npc:getName(), oldAnimiation, animationId));
    else
        player:PrintToPlayer("You must enter a valid NPC ID and animation ID.");
    end
end