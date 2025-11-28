✅ Step 1: Stop all running containers
docker stop $(docker ps -aq) 2>/dev/null

✅ Step 2: Remove all containers
docker rm -f $(docker ps -aq) 2>/dev/null


✔️ -f ensures even stubborn containers are deleted
✔️ Errors are hidden if nothing exists

✅ Step 3: Remove all images
docker rmi -f $(docker images -q) 2>/dev/null


✔️ -f forces removal
✔️ Cleans up everything

✅ Full Cleanup Command (copy-paste)
docker stop $(docker ps -aq) 2>/dev/null
docker rm -f $(docker ps -aq) 2>/dev/null
docker rmi -f $(docker images -q) 2>/dev/null

🔍 Optional: Remove unused volumes

If you also want to remove WordPress/MySQL volumes:

docker volume prune -f

🔍 Optional: Remove unused networks
docker network prune -f

🎉 After cleanup, verify
docker ps -a
docker images
