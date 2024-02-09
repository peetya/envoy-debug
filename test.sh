#!/bin/bash

expected1="1"
expected2="2"

echo "Testing nginx1 output calling from nginx1..."
test1=$(docker compose exec -T nginx1 curl -s http://nginx1.foo)
if [ "$test1" == "$expected1" ]; then
    echo "Test 1 passed"
else
    echo "Test 1 failed"
fi

echo "Testing nginx2 output calling from nginx1..."
test2=$(docker compose exec -T nginx1 curl -s http://nginx2.foo)
if [ "$test2" == "$expected2" ]; then
    echo "Test 2 passed"
else
    echo "Test 2 failed"
fi

echo "Testing nginx1 output calling from nginx2..."
test3=$(docker compose exec -T nginx2 curl -s http://nginx1.foo)
if [ "$test3" == "$expected1" ]; then
    echo "Test 3 passed"
else
    echo "Test 3 failed"
fi

echo "Testing nginx2 output calling from nginx2..."
test4=$(docker compose exec -T nginx2 curl -s http://nginx2.foo)
if [ "$test4" == "$expected2" ]; then
    echo "Test 4 passed"
else
    echo "Test 4 failed"
fi