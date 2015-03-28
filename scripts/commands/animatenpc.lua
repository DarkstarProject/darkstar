---------------------------------------------------------------------------------------------------
-- func: @animatenpc <npcId> <animationId>
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
        local npc = GetNPCByID( npcId, player );
        if (npc == nil) then
            return;
        end
        local oldAnimiation = npc:getAnimation();
        npc:setAnimation( animationId );
        npc:setStatus(STATUS_NORMAL);
        player:PrintToPlayer(string.format("NPC ID: %i | Old animation: %i | New animation: %i\n", npcId, oldAnimiation, animationId));
    else
        player:PrintToPlayer("You must enter a valid NPC ID and animation ID.");
    end
end