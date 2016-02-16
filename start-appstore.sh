#!/bin/bash

cd /app
exec meteor --port 80 $@
