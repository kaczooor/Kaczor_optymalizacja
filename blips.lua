local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
	-- Postes de polices
	       	       {title="Sklep Multimedialny",colour=59, id=52, x=67.44, y=-1568.49, z=28},
	{title="Sklep Budowlany",colour=59, id=478, x=2748.58, y=3472.41, z=54.68},
	{title="Tequil-La La",colour=27, id=93, x=-565.906, y=276.093, z=100.176},
	{title="Bahamas",colour=27, id=93,x =-1388.409, y =-585.624, z =100.319},
	{title="Stripclub",colour=27, id=121,x =132.17, y =-1304.42, z =100.319},
	{title="Yellow Jack",colour=27, id=93,x =1992.69, y =3058.57, z =100.319},
	{title="Sklep",colour=2, id=52,x =373.875, y =325.896, z =100.319},
	{title="Sklep",colour=2, id=52,x =2557.458, y =382.282, z =100.319},
	{title="Sklep",colour=2, id=52,x =-3038.939, y =585.954, z =6.908},
	{title="Sklep",colour=2, id=52,x =-3241.927, y =1001.462, z =11.830},
	{title="Sklep",colour=2, id=52,x =547.431, y =2671.710, z =41.156},
	{title="Sklep",colour=2, id=52,x =1961.464, y =3740.672, z =31.343},
	{title="Sklep",colour=2, id=52,x =2678.916, y =3280.671, z =54.241},
	{title="Sklep",colour=2, id=52,x =1729.216, y =6414.131, z =34.037},
	{title="Sklep",colour=2, id=52,x =1135.808, y =-982.281, z =45.415},
	{title="Sklep",colour=2, id=52,x =-1222.915, y =-906.983, z =11.326},
	{title="Sklep",colour=2, id=52,x =-1487.553, y =-379.107, z =39.163},
	{title="Sklep",colour=2, id=52,x =-2968.243, y =390.910, z =14.043},
	{title="Sklep",colour=2, id=52,x =1166.024, y =2708.930, z =37.157},
	{title="Sklep",colour=2, id=52,x =1392.562, y =3604.648, z =33.980},
	{title="Sklep",colour=2, id=52,x =-48.519, y =-1757.514, z =28.421},
	{title="Sklep",colour=2, id=52,x =1163.373, y =-323.801, z =68.205},
	{title="Sklep",colour=2, id=52,x =-707.501, y =-914.260, z =18.215},
	{title="Sklep",colour=2, id=52,x =-1820.523, y =792.518, z =137.118},
    {title="Sklep",colour=2, id=52,x =1698.388, y =4924.404, z =41.063},
    {title="Sklep",colour=2, id=52,x =-1094.66, y =-2595.03, z =13.93},
    {title="Sklep",colour=2, id=52,x =25.93, y =-1347.47, z =29.5},
    {title="Sklep",colour=2, id=52,x =197.66, y =-32.41, z =69.89},
    {title="Sklep",colour=2, id=52,x =-2540.82, y =2314.24, z =32.41},
    {title="Sklep",colour=2, id=52,x =161.27, y =6640.09, z =31.7},
	{title="Sklep",colour=2, id=52,x =190.2,  y = -889.22, z = 29.71},
	{title="Hype mobile", colour=2, id=459,x = -629.7,  y = -275.16,  z = 35.58},
		
	
  }

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)
