To correct the timing error, you can use intermediate variables within the process to ensure proper signal updates. Here's the corrected code:
```vhdl
process (clk)
  variable v_signal1 : std_logic := '0';
begin
  if rising_edge(clk) then
    if condition1 then
      v_signal1 := '1';
    else
      v_signal1 := '0';
    end if;
    signal1 <= v_signal1;
  end if;
end process;
```
By using a variable `v_signal1`, the logic for determining the next value of `signal1` is executed within the current clock cycle. The assignment to `signal1` is then scheduled for the next clock cycle which avoids race conditions and ensures that the signal value changes as intended.  Another alternative is to use a separate process to handle the signal assignment:  Avoid using signal as a variable in the process.  This makes it more readable and easier to track signal updates.  The example above is one of the solutions; other solutions may depend on the use case of the signal.