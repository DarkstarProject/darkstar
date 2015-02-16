---------------------------------------------------------------------------------------------------
-- func: @testmode <on / off>
-- auth: TeoTwawki
-- desc: Sometimes GodMode would actually get in the way of testing because of stats changes,
--       yet you need to be able to survive the mob you are testing. So now we have TestMode.
--       Note: does NOT persist through zoning, logout, or connection loss.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 3,
    parameters = "s"
};

function onTrigger(player, toggle)
    if (toggle == "off") then
        -- Remove bonus effects..
        player:delStatusEffect(EFFECT_MAX_HP_BOOST);
        player:delStatusEffect(EFFECT_MAX_MP_BOOST);
        player:delStatusEffect(EFFECT_REGAIN);
        player:delStatusEffect(EFFECT_REFRESH);
        player:delStatusEffect(EFFECT_REGEN);
        player:delStatusEffect(EFFECT_AQUAVEIL);
        player:delStatusEffect(EFFECT_NEGATE_PETRIFY,1,0,0);
        player:delStatusEffect(EFFECT_NEGATE_TERROR,1,0,0);
        player:delStatusEffect(EFFECT_NEGATE_AMNESIA,1,0,0);
        player:delStatusEffect(EFFECT_NEGATE_DOOM,1,0,0);
        player:delStatusEffect(EFFECT_NEGATE_POISON,1,0,0);
    elseif (toggle == "on") then
        -- Add bonus effects to the player..
        player:addStatusEffect(EFFECT_MAX_HP_BOOST,1000,0,0);
        player:addStatusEffect(EFFECT_MAX_MP_BOOST,1000,0,0);
        player:addStatusEffect(EFFECT_REGAIN,150,1,0);
        player:addStatusEffect(EFFECT_REFRESH,250,0,0);
        player:addStatusEffect(EFFECT_REGEN,250,0,0);
        player:addStatusEffect(EFFECT_AQUAVEIL,75,0,0);
        player:addStatusEffect(EFFECT_NEGATE_PETRIFY,1,0,0);
        player:addStatusEffect(EFFECT_NEGATE_TERROR,1,0,0);
        player:addStatusEffect(EFFECT_NEGATE_AMNESIA,1,0,0);
        player:addStatusEffect(EFFECT_NEGATE_DOOM,1,0,0);
        player:addStatusEffect(EFFECT_NEGATE_POISON,1,0,0);

        -- Heal the player from the new buffs..
        player:addHP( 9999 );
        player:setMP( 9999 );
    else
        player:PrintToPlayer("Invalid parameters.");
    end
end;