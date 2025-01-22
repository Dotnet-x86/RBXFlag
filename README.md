markdown
# Flag Library for Roblox

## Overview

`Flag` is a flexible library for handling flag-based systems in Roblox. It allows you to define, manage, and manipulate flags using integers, which are highly efficient for storage and performance. The library provides an easy way to store multiple flags within a single integer and offers functions to toggle, check, and manage flag states.

This library is useful for handling a variety of use cases, such as managing multiple boolean attributes or states in a compact manner, ideal for performance-critical systems.

## Features

- **Compact Storage**: Flags are stored in an integer, which allows for efficient storage and performance.
- **Easy Flag Management**: Supports toggling, checking, and clearing flags.
- **Custom Flag Definitions**: Allows you to define your own flags and their corresponding boolean values.
- **Compatibility**: Works well with Roblox games and can be used in a variety of scenarios where boolean states are required.

## Usage

### Create a Flag Instance

You can create a `Flag` instance by passing a table of flag definitions.

```lua
local myFlag = Flag.new({
    IsJumping = false,
    IsRunning = false
})
```
Check Multiple Flags
You can check if multiple flags are active at once:

```lua
if myFlag:HasFlags("IsJumping", "IsRunning") then
    print("The player is both jumping and running!")
end
```
Toggle Flags
You can toggle the value of a flag:

```lua
myFlag:Toggle("IsRunning")
```
Clear All Flags
You can reset all flags to false using the Clear function:

```lua
myFlag:Clear()
```
Set Multiple Flags
You can set multiple flags at once:

```lua
myFlag:SetFlags({
    IsJumping = true,
    IsRunning = true
})
```
Get Active Flags
To retrieve a list of all active flags:

```lua
local activeFlags = myFlag:GetActiveFlags()
for _, flag in ipairs(activeFlags) do
    print(flag)
end
```
Example of Flag Usage with Integer
You can also load the flag state from an integer:
```lua
myFlag(7) -- Loads the flag state based on the integer value.
```
## API Documentation

- **HasFlag(name: string):**  
  Checks if the flag with the given name is active.  
  Returns `true` if the flag is active, otherwise `false`.

- **HasFlags(...: string):**  
  Checks if all the flags with the given names are active.  
  Returns `true` only if all specified flags are active, otherwise `false`.

- **IsEmpty():**  
  Checks if no flags are active.  
  Returns `true` if no flags are active, otherwise `false`.

- **Toggle(name: string):**  
  Toggles the value of the specified flag.  
  If the flag is active, it becomes inactive; if it's inactive, it becomes active.

- **Clear():**  
  Resets all flags to `false`.  
  This will clear all the flags and set them to inactive.

- **SetFlags(flags: table):**  
  Sets multiple flags at once.  
  Takes a table where each key is the flag name and the value is a boolean (`true` or `false`) indicating the desired state.

- **GetActiveFlags():**  
  Returns a list of all active flags.  
  This will return a table of flag names that are currently active.

- **__call(int: number):**  
  Sets the flag state based on the provided integer value.  
  If the integer corresponds to a valid state, it updates the flags accordingly. If not, a warning is shown.

Contributions
Feel free to fork the repository and submit pull requests if you'd like to contribute. For any bugs or feature requests, open an issue on GitHub.

License
This library is open-source and licensed under the MIT License.
