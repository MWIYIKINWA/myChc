<?php

namespace App\Http\Controllers;

use App\Models\Sermon;
use Illuminate\Http\Request;
use Illuminate\Routing\Controllers\HasMiddleware;
use Illuminate\Routing\Controllers\Middleware;
use Illuminate\Support\Facades\Gate;
class SermonController extends Controller implements HasMiddleware
{

    public static function middleware()
    {
        return [
            new Middleware('auth:sanctum', except: ['index', 'show'])
        ];
    }
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        //
        //return Sermon::all();
        //return Sermon::latest()->get();
        return Sermon::with('user')->latest()->get();
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $fields = $request->validate([
            'title' => 'required|max:255',
            'scripture' => 'required',
            'message' => 'required'
        ]);

        $sermon = $request->user()->sermons()->create($fields);

        return ['sermon' => $sermon, 'user' => $sermon->user];
    }

    /**
     * Display the specified resource.
     */
    public function show(Sermon $sermon)
    {
        //
        return ['sermon' => $sermon, 'user' => $sermon->user];


    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, Sermon $sermon)
    {
        //
        Gate::authorize('modify', $sermon);

        $fields = $request->validate([
            'title' => 'required|max:255',
            'scripture' => 'required',
            'message' => 'required'
        ]);

        $sermon->update($fields);

        return ['sermon' => $sermon, 'user' => $sermon->user];
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Sermon $sermon)
    {

        Gate::authorize('modify', $sermon);
        $sermon->delete();

        return ['message' => 'Sermon Deleted'];
    }
}