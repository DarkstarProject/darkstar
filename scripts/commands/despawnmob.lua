---------------------------------------------------------------------------------------------------
-- func: despawnmob <mobid-optional>
-- desc: Despawns the given mob <t> or mobID)
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, mobId)
    local targ = player:getCursorTarget();
    if (targ ~= nil and mobId == nil) then
        DespawnMob(targ:getID());
        player:PrintToPlayer(targ:getID() .. " despawned.");
    elseif (mobId ~= nil and (mobId ~= nil or tonumber(mobId) ~= nil or tonumber(mobId) ~= 0)) then
        DespawnMob(mobId);
        player:PrintToPlayer(mobId .. " despawned.");
    else
        player:PrintToPlayer("No target specified.");
    end;
end
