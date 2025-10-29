# ⚙️ Continuous Assignment vs Procedural Blocking Assignment in Verilog

This document explains the **typical format**, **use cases**, and **evaluation mechanism** of  
**Continuous Assignments** and **Procedural Blocking Assignments** in Verilog HDL.

---

## 🧭 Overview

Verilog provides two primary mechanisms for assigning values to signals:

| Type | Modeling Style | Keyword | Execution Nature |
|------|----------------|----------|------------------|
| **Continuous Assignment** | Dataflow Modeling | `assign` | Continuously active |
| **Procedural Blocking Assignment** | Behavioral Modeling | `=` | Sequential (blocking) |

---

## 🚀 Continuous Assignment

### 🧩 Typical Format
A continuous assignment is written using the `assign` keyword and is used to drive **nets** such as `wire`, `tri`, or `wand`.
assign <net> = <expression>;

It represents **dataflow modeling**, meaning that the output continuously depends on the current values of the inputs.

---

### 💡 Used Cases

1. **Combinational Logic Modeling** — Used to describe simple logical relationships such as AND, OR, XOR, etc.  
2. **Bus Concatenation or Splitting** — Combines smaller signals into larger buses or extracts bits from them.  
3. **Conditional Logic** — Implements multiplexers or conditional selections using the ternary operator (`?:`).  
4. **Tri-State Logic** — Drives high-impedance (`Z`) or valid logic levels based on control signals.  
5. **Constant or Derived Connections** — Ties a signal to a fixed logic value (e.g., power or ground).

---

### 🔄 How Evaluation Happens

- Continuous assignments are **always active** throughout simulation.  
- When any signal appearing on the **right-hand side (RHS)** of the expression changes value, Verilog **automatically re-evaluates** the expression.  
- The result is **immediately driven** onto the **left-hand side (LHS)** net.  
- There is **no clock** or procedural trigger — the assignment updates continuously as inputs change.

This mechanism ensures that outputs reflect the most recent values of the inputs at all times.

---

## ⚙️ Procedural Blocking Assignment

### 🧩 Typical Format
A blocking assignment uses the `=` operator and is placed **inside procedural blocks** such as `always` or `initial`.  
It operates on **variables** such as `reg` or `integer`.
<variable> = <expression>;

The name *blocking* indicates that the statement must finish executing before the next statement in the block begins.

---

### 💡 Used Cases

1. **Behavioral Combinational Logic** — Describes combinational functions within `always @(*)` blocks.  
2. **Algorithmic or Step-by-Step Modeling** — Models operations that depend on intermediate results.  
3. **Testbench or Simulation Control** — Controls simulation flow with delays or event ordering.  
4. **Temporary Variable Computations** — Stores intermediate calculations for reuse within a block.  

---

### 🔄 How Evaluation Happens

- Executed **sequentially** inside a procedural block.  
- The **RHS expression** is evaluated and assigned to the **LHS variable immediately**.  
- Once the assignment completes, the next statement executes — hence the name *blocking*.  
- Each statement executes in order, producing a **step-by-step** procedural behavior.  
- The updated LHS value is immediately visible to subsequent statements within the same block.

This behavior allows complex algorithmic or conditional logic to be expressed in Verilog.

---

## 🧠 Comparison Summary

| Feature | Continuous Assignment | Procedural Blocking Assignment |
|----------|----------------------|--------------------------------|
| **Keyword** | `assign` | `=` |
| **Modeling Style** | Dataflow | Behavioral |
| **Used Inside** | Outside procedural blocks | Inside `always` or `initial` blocks |
| **Applicable To** | Nets (`wire`, `tri`) | Variables (`reg`, `integer`) |
| **Execution** | Continuous and parallel | Sequential and blocking |
| **Triggering Mechanism** | Automatic on RHS signal change | Sensitivity list (`@(*)`, `@(posedge clk)`) |
| **Evaluation Timing** | Continuous re-evaluation | Immediate execution within block |
| **Best For** | Simple combinational circuits | Algorithmic or step-by-step combinational logic |
| **Delay Support** | Possible using `assign #delay` | Possible using `= #delay` |
| **Hardware Equivalent** | Direct logic connection | Behavioral RTL logic description |

---

## 🧾 Summary

- **Continuous Assignment** continuously drives a signal based on changes in its inputs.  
  It is ideal for **simple combinational and dataflow logic**.  
- **Procedural Blocking Assignment** executes statements sequentially within procedural blocks.  
  It is suitable for **behavioral modeling** and **algorithmic descriptions**.  
- Continuous assignments operate **concurrently**, while blocking assignments operate **step-by-step**.  
- Both are typically used for **combinational logic**, while **non-blocking (`<=`)** assignments are used for **sequential (clocked)** logic.

---

🧠 **In essence:**
> Continuous assignment behaves like a live wire connection continuously updating with input changes,  
> while a procedural blocking assignment behaves like a series of instructions executed in order within a process.
