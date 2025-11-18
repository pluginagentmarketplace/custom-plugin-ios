---
name: game-development
description: Game development fundamentals including game engines (Unity, Unreal), graphics, physics, AI, multiplayer networking, and game architecture.
---

# Game Development

Create engaging interactive experiences across platforms.

## Game Engine Selection

| Engine | Best For | Language |
|--------|----------|----------|
| **Unity** | 2D/3D, mobile, VR | C# |
| **Unreal** | High-fidelity 3D | C++ / Blueprint |
| **Godot** | Indie, 2D | GDScript |
| **Cocos2d** | Mobile 2D | C++/Lua |

## Unity Game Architecture

```csharp
using UnityEngine;

public class Player : MonoBehaviour {
    private Rigidbody rb;
    public float moveSpeed = 5f;
    public float jumpForce = 5f;

    private void Start() {
        rb = GetComponent<Rigidbody>();
    }

    private void Update() {
        HandleInput();
    }

    private void HandleInput() {
        float moveX = Input.GetAxis("Horizontal");
        float moveZ = Input.GetAxis("Vertical");

        Vector3 move = transform.right * moveX + transform.forward * moveZ;
        rb.velocity = new Vector3(move.x * moveSpeed, rb.velocity.y, move.z * moveSpeed);

        if (Input.GetKeyDown(KeyCode.Space)) {
            Jump();
        }
    }

    private void Jump() {
        rb.velocity += Vector3.up * jumpForce;
    }
}
```

## Game Loop Pattern

```
Initialize Game
    ↓
┌─── Game Loop ───┐
│                 │
│  Input → Update → Render
│                 │
└─────────────────┘
    ↓
Cleanup & Exit
```

## Physics Integration

```csharp
// 3D Physics
Rigidbody rb = GetComponent<Rigidbody>();
rb.velocity = new Vector3(10f, 0f, 0f);
rb.AddForce(direction * force, ForceMode.Impulse);

// 2D Physics
Rigidbody2D rb2d = GetComponent<Rigidbody2D>();
rb2d.velocity = new Vector2(10f, 0f);
rb2d.AddForce(direction * force, ForceMode2D.Impulse);
```

## Animation System

```csharp
// Animator parameters
animator.SetBool("isRunning", true);
animator.SetFloat("speed", moveSpeed);
animator.SetTrigger("jump");

// Animation state monitoring
if (animator.GetCurrentAnimatorStateInfo(0).IsName("Jump")) {
    // Handle jump animation
}
```

## Game AI

### Simple State Machine
```csharp
public enum EnemyState { Idle, Patrol, Chase, Attack }

public class Enemy : MonoBehaviour {
    private EnemyState state = EnemyState.Idle;
    private float detectionRange = 10f;
    private Transform player;

    private void Update() {
        switch (state) {
            case EnemyState.Idle:
                HandleIdle();
                break;
            case EnemyState.Chase:
                HandleChase();
                break;
        }
    }

    private void HandleIdle() {
        if (Vector3.Distance(transform.position, player.position) < detectionRange) {
            state = EnemyState.Chase;
        }
    }

    private void HandleChase() {
        transform.position = Vector3.MoveTowards(
            transform.position,
            player.position,
            5f * Time.deltaTime
        );
    }
}
```

## Multiplayer Networking

### Client-Server Model
```csharp
// Using Netcode for GameObjects (Unity)
public class PlayerMovement : NetworkBehaviour {
    [SerializeField] private float moveSpeed = 5f;

    private void Update() {
        if (!IsOwner) return;

        float moveX = Input.GetAxis("Horizontal");
        float moveZ = Input.GetAxis("Vertical");
        Vector3 move = new Vector3(moveX, 0, moveZ).normalized;

        transform.position += move * moveSpeed * Time.deltaTime;
        MoveServerRpc(transform.position);
    }

    [ServerRpc]
    private void MoveServerRpc(Vector3 newPosition) {
        // Validate movement on server
        transform.position = newPosition;
    }
}
```

## Performance Optimization

### Object Pooling
```csharp
public class BulletPool : MonoBehaviour {
    public static List<Bullet> bullets = new List<Bullet>();
    private Bullet bulletPrefab;

    private void Start() {
        // Pre-create bullets
        for (int i = 0; i < 100; i++) {
            Bullet bullet = Instantiate(bulletPrefab);
            bullet.gameObject.SetActive(false);
            bullets.Add(bullet);
        }
    }

    public Bullet GetBullet() {
        foreach (Bullet bullet in bullets) {
            if (!bullet.gameObject.activeInHierarchy) {
                bullet.gameObject.SetActive(true);
                return bullet;
            }
        }
        return null; // Pool exhausted
    }
}
```

### Level Streaming
```csharp
// Load/unload levels based on player distance
if (Vector3.Distance(player.position, levelBounds.center) > detectionRange) {
    SceneManager.UnloadSceneAsync(levelName);
} else {
    SceneManager.LoadSceneAsync(levelName, LoadSceneMode.Additive);
}
```

## Game Development Checklist

- [ ] Game loop implemented
- [ ] Input system responsive
- [ ] Physics working correctly
- [ ] Camera follows player smoothly
- [ ] Audio feedback implemented
- [ ] UI responsive and clear
- [ ] Performance optimized (60 FPS)
- [ ] Save/load system working
- [ ] Networking tested (multiplayer)
- [ ] Playtested by others

## Common Game Problems

| Problem | Solution |
|---------|----------|
| Jittery movement | Use fixed timestep, interpolation |
| Slow performance | Object pooling, LOD, occlusion culling |
| Multiplayer lag | Interpolation, prediction, server authority |
| Memory leaks | Proper cleanup in OnDestroy |

---

**Great games come from great game design. Balance gameplay over graphics!**
