-----------------------------------
-- Area: Pashhow_Marshlands(S)
--  NPC: ??? (Kinepikwa)
-- Allow player to spawn Kinepikwa with Peiste pellets
--
-----------------------------------
-----------------------------------
function onTrade(player,npc,trade)


    if (GetMobAction(17146147) == 0 and trade:hasItemQty(2564,1) and trade:getItemCount() == 1) then
        player:tradeComplete();
        SpawnMob(17146147):updateClaim(player); -- Kinepikwa
    end

end;

function onTrigger(player,npc)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;