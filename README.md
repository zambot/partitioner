Partitioner
=============

The Partitioner can be used to evenly distribute sets of anything
with a numeric cost to into buckets.

Proposed usage and reason for existence is to distribute specs over
multiple machines.

Inputs
-------

At first, the knowledge base must be preseeded wih your data.
The datastructure is an Array, where each element is a bi-tupel of

    [ Identifier,  Costs ]

Examples
-------

See specs for examples
