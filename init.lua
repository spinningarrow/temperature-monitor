gpio.mode(6, gpio.INPUT)

station_cfg={}
station_cfg.ssid=""
station_cfg.pwd=""
station_cfg.save=true
wifi.sta.config(station_cfg)

print(dht.read(6))

require("httpserver").createServer(80, function(req, res)
	print("+R", req.method, req.url, node.heap())
	status, temp, humi, temp_dec, humi_dec = dht.read(6)
	res:finish(string.format('{ "status": %d, "temperature": %d, "humidity": %d }', status, temp, humi))
end)
