markdown
คัดลอก
แก้ไข
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
Check If a Flag is Active
You can check if a specific flag is active by using the HasFlag function:

lua
if myFlag:HasFlag("IsJumping") then
    print("The player is jumping!")
end
Check Multiple Flags
You can check if multiple flags are active at once:

lua
if myFlag:HasFlags("IsJumping", "IsRunning") then
    print("The player is both jumping and running!")
end
Toggle Flags
You can toggle the value of a flag:

lua
myFlag:Toggle("IsRunning")
Clear All Flags
You can reset all flags to false using the Clear function:

lua
myFlag:Clear()
Set Multiple Flags
You can set multiple flags at once:

lua
myFlag:SetFlags({
    IsJumping = true,
    IsRunning = true
})
Get Active Flags
To retrieve a list of all active flags:

lua
local activeFlags = myFlag:GetActiveFlags()
for _, flag in ipairs(activeFlags) do
    print(flag)
end
Example of Flag Usage with Integer
You can also load the flag state from an integer:

lua
myFlag(7) -- Loads the flag state based on the integer value.
API Documentation
HasFlag(name: string): Checks if the flag with the given name is active.
HasFlags(...: string): Checks if all the flags with the given names are active.
IsEmpty(): Checks if no flags are active.
Toggle(name: string): Toggles the value of the specified flag.
Clear(): Resets all flags to false.
SetFlags(flags: table): Sets multiple flags at once.
GetActiveFlags(): Returns a list of all active flags.
__call(int: number): Sets the flag state based on the provided integer value.
Contributions
Feel free to fork the repository and submit pull requests if you'd like to contribute. For any bugs or feature requests, open an issue on GitHub.

License
This library is open-source and licensed under the MIT License.

Contact
If you have any questions or need further assistance, feel free to reach out to me through the GitHub Issues page.
