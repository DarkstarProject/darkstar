-----------------------------------------------------------
--	[Command name]: setweather
--	[Author      ]: 
--	[Description ]: Changes weather of current zone
-----------------------------------------------------------

-----------------------------------------------------------
-- Action
-----------------------------------------------------------

function onTrigger(player,weather)
printf("Weather Change Requested");

	if(weather=="NONE" or weather=="none" or weather=='0') then
		player:setWeather(0);
	elseif(weather=="SUNSHINE" or weather=="sunshine" or weather=='1') then
		player:setWeather(1);
	elseif(weather=="CLOUDS" or weather=="clouds" or weather=='2') then
		player:setWeather(2);
	elseif(weather=="FOG" or weather=="fog" or weather=='3') then
		player:setWeather(3);
	elseif(weather=="HOT SPELL" or weather=="hot spell" or weather=='4') then
		player:setWeather(4);
	elseif(weather=="HEAT WAVE" or weather=="heat wave" or weather=='5') then
		player:setWeather(5);
	elseif(weather=="RAIN" or weather=="rain" or weather=='6') then
		player:setWeather(6);
	elseif(weather=="SQUALL" or weather=="squall" or weather=='7') then
		player:setWeather(7);
	elseif(weather=="DUST STORM" or weather=="dust storm" or weather=='8') then
		player:setWeather(8);
	elseif(weather=="SAND STORM" or weather=="sand storm" or weather=='9') then
		player:setWeather(9);
	elseif(weather=="WIND" or weather=="wind" or weather=='10') then
		player:setWeather(10);
	elseif(weather=="GALES" or weather=="gales" or weather=='11') then
		player:setWeather(11);
	elseif(weather=="SNOW" or weather=="snow" or weather=='12') then
		player:setWeather(12);
	elseif(weather=="BLIZZARDS" or weather=="blizzards" or weather=='13') then
		player:setWeather(13);
	elseif(weather=="THUNDER" or weather=="thunder" or weather=='14') then
		player:setWeather(14);
	elseif(weather=="THUNDERSTORMS" or weather=="thunderstorm" or weather=='15') then
		player:setWeather(15);
	elseif(weather=="AURORAS" or weather=="auroras" or weather=='16') then
		player:setWeather(16);
	elseif(weather=="STELLAR GLARE" or weather=="stellar glare" or weather=='17') then
		player:setWeather(17);
	elseif(weather=="GLOOM" or weather=="gloom" or weather=='18') then
		player:setWeather(18);
	elseif(weather=="DARKNESS" or weather=="darkness" or weather=='19') then
		player:setWeather(19);
	else
		print('Unrecognised Weather');
	end
end;