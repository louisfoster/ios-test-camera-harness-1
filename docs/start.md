#### Nodes on nodes on nodes

Listening to synthwave had really got me wanting to move away from tile mapping for a mo' and work on the camera harness system. I also wanted to give the template guide I created, [here](https://github.com/louisfoster/edocxcode), a run.


#### Features of the harness

I wanted to have a camera that could achieve some fairly straight forward tasks:

1. Track the player's avatar's position, and look at it
2. Have a third person view position, where it sits above the tracking point at a certain distance away and can swivel freely around this certain point (as if attached to a ring, fixed at the tracking center)
3. Adjust distance from the center when encountering barriers
4. Have a side view position
5. Have a first person view position
6. Respond to "drag" gestures (and events which dictate it's "view" mode)


#### Basic implementation

The first task is basically a proof of features 1 and 2. At first I didn't think I needed as many nodes as I ended up using (not that very many, I wasn't being conservative so much as naive).

The first step was to create an avatar "node," which in effect is two nodes. The first node holds the position of the avatar. This then has a child node which holds the model of the avatar itself. This is important as we may want to adjust the position/rotation/scale of the model but not affect anything else. It's the avatar position, not the model position, we want to track.

We also need to create the camera node. These two nodes are then provided to the harness, as the "tracking" node (as in, what are we tracking? That is, the avatar) and the "subject" node (as in, what is a subject of the harness? That is, the camera). The harness is made a child of the tracking node, and subject is made a child of harness. We can then allow the harness to always follow the avatar, and freely rotate and also position the camera independently of anything else.

Funnily, the set up of this is really simple and where the bulk of my time and learning came from was trying to create the visual proof of the harness in action. I learned about `SCNFloor` which creates a basic slightly reflective surface, so that I could depict the avatar in some kind of "space". The next thing was showing the independence of the model vs. the harness. Without this space, or other objects, I couldn't show when I rotate the model and the harness separately. So I added some basic shapes (sphere, cone) and placed them close to the model itself.

One this I also noticed was that I had mixed up, and forgotten, to add the `addChildNode(<node>)` functions where they were needed, which caused lots of confusion around why the camera wasn't doing as it should've. However, in the end it turned out like so:
![harness0]({{ "./assets/harness0.gif" | absolute_url }})

As is shown, the model is spinning quickly in an anti-clockwise rotation upon it's own y axis. The harness is rotating slowly around it's own y axis in the opposite direction (as evidenced by the cone and sphere shapes spinning around the scene). The harness also tracks the avatar as demonstrated by the movement of the avatar away from the cone and sphere whilst the camera follows it from a consistent height and distance.


#### De-automation

It's all well and good for the camera to move when told my a looping rotation as well as all the other stuff going on. However, this needs to be way more interactive. I want to be able to drag my thumb across the screen, left to right, and see that reflected by an incremental rotation of the harness. Not this spinning stuff! As with the tile map, I need to provide some method of accepting an input call that subscribes to the drag (aka `UIPanGestureRecognizer`) and run a method accordingly.

Feature 3 can be implemented with collision events. Feature 4 and 5 will be addressed later...

[Home](./)