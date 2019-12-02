-----------------------------------
-- SOA Geomagnetic Founts
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

tpz = tpz or {}
tpz.geomagneticFount = tpz.geomagneticFount or {}

tpz.geomagneticFount.checkFount = function(player, npc)
    local theGeomagnetron = player:getCurrentMission(SOA) == tpz.mission.id.soa.THE_GEOMAGNETRON
    local charged = player:getCharVar("SOA") == 1

    if theGeomagnetron and charged then
        player:messageSpecial(zones[player:getZoneID()].text.GEOMAGNETRON_ATTUNED + 2) -- Your device has already been attuned to a geomagnetic fount in the corresponding locale.
    elseif theGeomagnetron then
        player:messageSpecial(zones[player:getZoneID()].text.GEOMAGNETRON_ATTUNED, 0, tpz.ki.GEOMAGNETRON) -- Your <keyitem> has been attuned to a geomagnetic fount in the corresponding locale.
        player:setCharVar("SOA", 1)
    else
        player:messageSpecial(zones[player:getZoneID()].text.GEOMAGNETRON_ATTUNED + 1) -- A faint energy wafts up from the ground.
    end
end
