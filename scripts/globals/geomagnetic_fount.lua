-----------------------------------
-- SOA Geomagnetic Founts
-----------------------------------
require("scripts/globals/keyitems")
require("scripts/globals/missions")
-----------------------------------

dsp = dsp or {}
dsp.geomagneticFount = dsp.geomagneticFount or {}

dsp.geomagneticFount.checkFount = function(player, npc)
    local theGeomagnetron = player:getCurrentMission(SOA) == dsp.mission.id.soa.THE_GEOMAGNETRON
    local charged = player:getVar("SOA") == 1

    if theGeomagnetron and charged then
        player:messageSpecial(zones[player:getZoneID()].text.YOUR_GEOMAGNETRON_HAS_ALREADY)
    elseif theGeomagnetron then
        player:messageSpecial(zones[player:getZoneID()].text.YOUR_GEOMAGNETRON_HAS_ATTUNED, 0, dsp.ki.GEOMAGNETRON)
        player:setVar("SOA", 1)
    else
        player:messageSpecial(zones[player:getZoneID()].text.A_FAINT_ENERGY_WAFTS_UP)
    end
end
