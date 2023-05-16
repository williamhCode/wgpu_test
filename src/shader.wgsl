// Vertex shader

struct VertexOutput {
    @builtin(position) clip_position: vec4<f32>,
    @location(0) color: vec4<f32>

};

@vertex
fn vs_main(
    @builtin(vertex_index) in_vertex_index: u32,
) -> VertexOutput {
    var out: VertexOutput;
    let x = f32(1 - i32(in_vertex_index)) * 0.5;
    let y = f32(i32(in_vertex_index & 1u) * 2 - 1) * 0.5;
    out.clip_position = vec4<f32>(x, y, 0.0, 1.0);
    switch in_vertex_index {
        case 0u: {
            out.color = vec4<f32>(1.0, 0.0, 0.0, 0.0);
        }
        case 1u: {
            out.color = vec4<f32>(0.0, 1.0, 0.0, 0.0);
        }
        case 2u: {
            out.color = vec4<f32>(0.0, 0.0, 1.0, 0.0);
        }
        default: {
            out.color = vec4<f32>(0.0, 0.0, 0.0, 0.0);
        }
    }
    return out;
}


@fragment
fn fs_main(in: VertexOutput) -> @location(0) vec4<f32> {
    return in.color;
}
