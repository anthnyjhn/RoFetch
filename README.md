
# RoFetch

RoFetch is a lightweight promise-based fetch module for Roblox that simplifies the fetching process for your game.

Read the [documentation](https://readme.so/editor) for more information




## Installation

Installing RoFetch is pretty easy. Import the module from Roblox library to your game and drag the module into ReplicatedStorage.

**Manual Installation**
1. Get [RoFetch](https://www.roblox.com/library/17412823952/RoFetch) from the Roblox library.
Place the module directly within ReplicatedStorage

2. Once the module is imported, you can require the module in your script

```lua
local RoFetch = require(ReplicatedStorage.Packages:WaitForChild('RoFetch'))
```
## Basic Usage

### Performing a **GET** request method
```lua
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local RoFetch = require(ReplicatedStorage.Packages:WaitForChild('RoFetch'))

-- Make a request using GET request method
RoFetch:get("https://api.restful-api.dev/objects?id=3&id=5&id=10"):andThen(function(response)
	-- handle success
	print(response)
end):catch(function(err)
	-- handle error
	print(err)
end):finally(function()
	-- always executed
end)
```
**Parameters** 
| Data | Description |
| ------------- | ------------- |
| *url: `string`* | The web address you are requesting data from. |
| *headers: `Variant`* | Used to specify some HTTP request headers. |

### Performing a **POST** request method

```lua
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local RoFetch = require(ReplicatedStorage.Packages:WaitForChild('RoFetch'))

-- Sample data to send in the request
local Data = {
	["name"] = "Apple MacBook Pro 16",
	["data"] = {
		["year"] = 2019,
		["price"] = 1849.99,
		["CPU model"] = "Intel Core i9",
		["Hard disk size"] = "1 TB"
	}
}

-- Make a request using POST request method
RoFetch:post('https://api.restful-api.dev/objects', RoFetch:encode(Data), Enum.HttpContentType.ApplicationJson, false):andThen(function(response)
	print(response)
end):catch(function(err)
	warn(err)
end)
```

**Parameters** 
| Data | Description |
| ------------- | ------------- |
| *url: `string`* | The web address you are requesting data from. |
| *data: `string`* | The data being sent. |
| *content_type: [Enum.HttpContentType](https://create.roblox.com/docs/reference/engine/enums/HttpContentType)* | Modifies the value in the Content-Type header sent with the request. Default Value: "ApplicationJson" |
| *compress: `bool`* | Determines whether the data is compressed (gzipped) when sent. |
| *headers: `any`* | Used to specify some HTTP request headers. |

### Performing a request method by passing the relevant **config** to RoFetch

```lua
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local RoFetch = require(ReplicatedStorage.Packages:WaitForChild('RoFetch'))

local RequestOptions = {
	Url = "http://httpbin.org/post", -- This website helps debug HTTP requests
	Method = "POST",
	Headers = {
		["Content-Type"] = "application/json", -- When sending JSON, set this!
	},
	Body = RoFetch:encode({ hello = "world" })
}

RoFetch:request(RequestOptions):andThen(function(response)
	print(response)
end)
```



## Built-in methods

These methods are already existing in [HttpService](https://create.roblox.com/docs/reference/engine/classes/HttpService) but we just added it in this RoFetch module to make it accessible in one module.

#### Encode

The encode method transforms a Lua table into a JSON string 

```lua
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local RoFetch = require(ReplicatedStorage.Packages:WaitForChild('RoFetch'))

-- Sample data
local Data = 
	{
		["name"] = "Apple MacBook Pro 16",
		["data"] = {
			["year"] = 2019,
			["price"] = 1849.99,
			["CPU model"] = "Intel Core i9",
			["Hard disk size"] = "1 TB"
		}
	}

-- Converting the Lua table into a JSON string
print(RoFetch:encode(Data))
```

| Parameter | Description                |
| :-------- | :------------------------- |
|*input: `table`* | The JSON object being decoded.|

 #### Decode

The decode method transforms JSON object or array into a Lua table 

```lua
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local RoFetch = require(ReplicatedStorage.Packages:WaitForChild('RoFetch'))

-- Make a request using GET request method
RoFetch:get("https://api.restful-api.dev/objects?id=3&id=5&id=10"):andThen(function(response)
	-- decode response
	print(RoFetch:decode(response))
end)
```


## Authors

- [@evaera](https://github.com/evaera) (roblox-lua-promise)
- [@anthnyjhn](https://github.com/anthnyjhn) (RoFetch)

