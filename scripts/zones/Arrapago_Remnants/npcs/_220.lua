


function onTrigger(entity, npc)
    entity:startEvent(300)
end

function onEventFinish(entity, eventid, result, door)
    if (eventid == 300 and result == 1) then
        door:setAnimation(8)
        local instance = door:getInstance();
        -- spawn mobs, etc
        for i,v in pairs(Arrapago.npcs[1][2]) do
            local npc = instance:getEntity(bit.band(v, 0xFFF), TYPE_NPC);
            npc:setStatus(STATUS_NORMAL)
        end
        for id = Arrapago.mobs[1][2].mobs_start, Arrapago.mobs[1][2].mobs_end do
            SpawnMob(id, instance)
        end
        door:untargetable(true)
    end
end
