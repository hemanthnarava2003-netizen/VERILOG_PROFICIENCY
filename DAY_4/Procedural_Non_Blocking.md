# ⚙️ Procedural Non-Blocking Assignments in Verilog

---

## 🧠 Overview

In **Verilog**, procedural assignments are used inside `always` or `initial` blocks to describe how signals change during simulation.  
There are two main types of procedural assignments:

| Type | Operator | Execution Behavior |
|------|-----------|--------------------|
| **Blocking** | `=` | Executes sequentially (one after another) |
| **Non-blocking** | `<=` | Executes concurrently (scheduled to occur later) |

The **procedural non-blocking assignment (`<=`)** allows multiple registers to update **simultaneously**, accurately modeling how flip-flops behave in real hardware.

---

## 💡 Definition

A **procedural non-blocking assignment** is an assignment that:
- Appears inside a procedural block such as `always` or `initial`
- Evaluates the **right-hand side (RHS)** immediately
- Schedules the **left-hand side (LHS)** to update **after** all current active events in that time step are complete

---

## 🧩 Typical Format
always @(posedge clk) begin
destination_register <= expression;
end

- `<=` → Non-blocking assignment operator  
- `destination_register` → Target signal (usually declared as `reg`)  
- `expression` → The value to be assigned (evaluated at the clock edge)

---

## ⚙️ Evaluation Process

During simulation, Verilog follows an event-driven scheduling mechanism divided into phases.  
For non-blocking assignments, the update occurs **in two stages**:

1. **Evaluation phase**  
   - The **RHS** of the assignment is evaluated immediately when the event (e.g., clock edge) occurs.  
   - The computed value is stored temporarily.

2. **Update phase (NBA region)**  
   - The **LHS** of the assignment is updated at the **end of the current time step**, after all blocking assignments and active events have completed.

This ensures that **all non-blocking assignments appear to happen simultaneously**, mimicking hardware flip-flop behavior.

---

## 🔍 Example of Evaluation Order

Consider the following conceptual sequence:
a <= b;
b <= a;

If initially `a = 1` and `b = 2`, then after a clock event:
1. RHS values are evaluated:  
   - `a <= b` → RHS = 2  
   - `b <= a` → RHS = 1
2. At the end of the time step:  
   - `a` becomes 2  
   - `b` becomes 1  

Thus, both signals update **simultaneously**, avoiding race conditions.

---

## 🛠️ Common Use Cases

| Use Case | Description |
|-----------|--------------|
| **Sequential logic** | Used in clocked `always` blocks to model registers and flip-flops |
| **Pipelining** | Enables multiple register stages to update together on the same clock edge |
| **Finite State Machines (FSMs)** | Ensures next-state and output registers are updated synchronously |
| **Avoiding race conditions** | Prevents one signal from being updated before another dependent signal in the same clock cycle |

---

## 🔄 Comparison: Blocking vs Non-Blocking Assignments

| Feature | Blocking (`=`) | Non-Blocking (`<=`) |
|----------|----------------|--------------------|
| Execution Order | Sequential | Parallel (scheduled) |
| Update Timing | Immediate | End of time step |
| Usage | Combinational logic | Sequential logic |
| Risk of Race Conditions | High | Low |
| Hardware Behavior | Not accurate for registers | Accurately models flip-flops |

---

## 📘 Key Concepts Summary

| Concept | Explanation |
|----------|--------------|
| **Definition** | Procedural assignment that defers updates until the end of the current time step |
| **Purpose** | To model hardware elements (like flip-flops) that update simultaneously on clock edges |
| **Evaluation** | RHS evaluated immediately, LHS updated later (non-blocking update region) |
| **Best Practice** | Use `<=` for sequential logic, and `=` for combinational logic |
| **Advantage** | Eliminates race conditions and models real hardware behavior accurately |

---

## 🧾 Conclusion

- Procedural non-blocking assignments (`<=`) are essential for **accurate digital hardware modeling**.  
- They ensure **simultaneous updates** of registers on clock edges.  
- The **evaluation and update separation** reflects the way **real flip-flops** behave.  
- Always prefer non-blocking assignments for **synchronous sequential logic**, and blocking assignments for **combinational logic**.

---

🧩 **Author:** *Your Name*  
📅 **Last Updated:** October 2025  
🔗 **License:** MIT  

> “Non-blocking assignments make your simulation behave like real hardware — everything updates together at the clock edge.” 🕒⚙️

