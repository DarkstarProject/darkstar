---------------------------------------------------------------------------------------------------
-- func: animatenpc
-- auth: PrBlahBlahtson
-- desc: Changes the animation of the given npc. (For testing purposes.)
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ii"
};

function onTrigger(player, npcId, animationId)
    if (npcId ~= nil and animationId ~= nil) then
        local npc = GetNPCByID( npcId );
        if (npc == nil) then return; end

        local oldAnimiation = npc:getAnimation();
        npc:setAnimation( animationId );
        
        player:PrintToPlayer(string.format("NPC ID: %i | Old animation: %i | New animation: %i\n", npcId, oldAnimiation, animationId));
    else
        player:PrintToPlayer("You must enter a valid npcid and animation id.");
    end
end