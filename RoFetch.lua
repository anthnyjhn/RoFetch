-- For preview only, please use the code in the Roblox Developer Marketplace.

local HttpService = game:GetService('HttpService')
local Promise = require(script.Parent:WaitForChild('Promise'))

local RoFetch = {}

-- Function to make a request with given configuration
function RoFetch:request(requestOptions: {Url: string, Method: string, Headers: any?, Body: any?, Compress: boolean?}): Promise
	local newPromise = Promise.new(function(resolve, reject)
		local success, result = pcall(function()
			return HttpService:RequestAsync(requestOptions)
		end)
		if success then
			resolve(result)
		else
			reject(result)
		end
	end)
	return newPromise
end

-- Function to make a GET request to a specified URL
function RoFetch:get(url: string, Headers: any?): Promise
	local newPromise = Promise.new(function(resolve, reject)
		local success, result = pcall(HttpService.GetAsync, HttpService, url, Headers)
		if success then
			resolve(result)
		else
			reject(result)
		end
	end)
	return newPromise
end

-- Function to make a POST request to a specified URL with optional data, content type, compression, and headers
function RoFetch:post(url: string, data: string, HttpContentType: Enum.HttpContentType?, compress: boolean?, headers: any): Promise
	local newPromise = Promise.new(function(resolve, reject)
		local success, result = pcall(HttpService.PostAsync, HttpService, url, data, HttpContentType, compress, headers)
		if success then
			resolve(result)
		else
			reject(result)
		end
	end)
	return newPromise
end

-- Function to decode a JSON API response
function RoFetch:decode(data: string): any
	return HttpService:JSONDecode(data)
end

-- Function to encode data to JSON format
function RoFetch:encode(data: any): string
	return HttpService:JSONEncode(data)
end

return RoFetch

--[[=========================================
Big thanks to @evaera for Promise-lua module.
========================================]]--
