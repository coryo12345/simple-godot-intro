shader_type canvas_item;

uniform sampler2D NOISE;
uniform sampler2D NOISE_2;

const float THRESHOLD_MIN = 0.45;
const float THRESHOLD_DIFF = 0.001; // how much should the wave shape change along the noise
const float WAVE_THICKNESS = 0.09;

const float MOVEMENT_DISTANCE = 0.02; // how far should it move back and forth
const float MOVEMENT_FREQ = 0.4; // how fast should it move back and forth

const float HORIZONTAL_STRETCH = 1.0;

const float PIXELATION_FACTOR = 200.0;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	// apply movement & stretch
	vec2 pixel = vec2((UV.x + sin(TIME*MOVEMENT_FREQ) * MOVEMENT_DISTANCE) / HORIZONTAL_STRETCH, UV.y);
	if (pixel.x < 0.0) {
		pixel.x += 1.0;
	}

	// now pixelate
	pixel = round(pixel * PIXELATION_FACTOR) / PIXELATION_FACTOR;

	vec4 noise = texture(NOISE, pixel);
	vec4 noise2 = texture(NOISE_2, pixel);
	float tmin = THRESHOLD_MIN + (sin(TIME) * THRESHOLD_DIFF);
	if (noise.r >= tmin && noise.r <= tmin + WAVE_THICKNESS) {
		COLOR = vec4(0.7,0.9,1.0,1.0);
	} else if (noise2.r >= tmin && noise2.r <= tmin + WAVE_THICKNESS) {
		COLOR = vec4(0.0,0.4,0.99,1.0);
	} else {
		COLOR = vec4(0.2,0.6,0.99,1.0);
	}
}
